//
// PLStatisticsViewController
//  fitSFU
//
//  Created by Kyle Griffith on 2016-03-12.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "PLStatisticsViewController.h"
#import "PowerLiftViewController.h"
#import "PLStatsCell.h"
@interface  PLStatisticsViewController()
{
    UILabel *_label;
    //constant 3
    NSArray *exercises;
    
    //Variable Amount based over time.
    NSMutableArray *deadliftMaxReps,*deadliftMaxWeight,*deadliftAvgReps,*deadliftAvgWeight,*deadliftTotReps;
    NSMutableArray *benchMaxReps,*benchMaxWeight,*benchAvgReps,*benchAvgWeight,*benchTotReps;
    NSMutableArray *squatMaxReps,*squatMaxWeight,*squatAvgReps,*squatAvgWeight,*squatTotReps;
    NSDate *oldDate;
    int *dateIndex;
    

}

@end

@implementation PLStatisticsViewController

@synthesize tableView; // Add this line of code
@synthesize benchScore,deadliftScore,squatScore;
@synthesize exercise;
- (void)viewDidLoad
{
    [super viewDidLoad];
    exercises= [[NSArray alloc] initWithObjects:@"Squat",@"Deadlift",@"Bench Press", nil];
    //Make these defaults created by data from detail
    
    deadliftMaxReps = [[NSMutableArray alloc] init];
    deadliftMaxWeight = [[NSMutableArray alloc] init];
    deadliftAvgReps = [[NSMutableArray alloc] init];
    deadliftAvgWeight = [[NSMutableArray alloc] init];
    deadliftTotReps = [[NSMutableArray alloc] init];
    benchMaxReps = [[NSMutableArray alloc] init];
    benchMaxWeight = [[NSMutableArray alloc] init];
    benchAvgReps = [[NSMutableArray alloc] init];
    benchAvgWeight = [[NSMutableArray alloc] init];
    benchTotReps = [[NSMutableArray alloc] init];
    squatMaxReps = [[NSMutableArray alloc] init];
    squatMaxWeight = [[NSMutableArray alloc] init];
    squatAvgReps = [[NSMutableArray alloc] init];
    squatAvgWeight = [[NSMutableArray alloc] init];
    squatTotReps = [[NSMutableArray alloc] init];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self gatherData];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [exercises count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 530;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"PLStatsCell";
    
    PLStatsCell *cell = (PLStatsCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PLStatsCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        // cell = [[WorkoutTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.exerciseLabel.text=[exercises objectAtIndex:indexPath.row];

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"DidSelectRowAtIndexPath");
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
}
-(void) createViews{
    self.view.backgroundColor = [UIColor redColor];
    
    CGRect top, bottom;
    CGRectDivide(self.view.bounds, &top, &bottom, self.view.bounds.size.height / 2, CGRectMinYEdge);
    
    _label = [[UILabel alloc] initWithFrame:CGRectInset(top, 5, 5)];
    [_label setFont:[UIFont fontWithName:@"Avenir" size:15]];
    _label.textColor=[UIColor whiteColor];
    _label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|
    UIViewAutoresizingFlexibleBottomMargin;
    _label.numberOfLines =2;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"Press back to keep on working out.              Your entry has been added to Statistics";
    [self.view addSubview:_label];
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight=[UIScreen mainScreen].bounds.size.height;
    NSLog(@"ScreenWidth: %f",screenwidth);
    CGFloat width = 100.0;
    CGFloat height= 124.0;
    
    UIImageView *image1 =[[UIImageView alloc] initWithFrame:CGRectMake(screenwidth/2-width/2,screenheight/2,width,height)];
    image1.image=[UIImage imageNamed:@"ok-icon.png"];
    [self.view addSubview:image1];
    
    
    
    
}
- (void)gatherData
{
    if (_newData) {
        [self createViews];
        self.title= @"Good Set!";
        if ([exercise isEqualToString:@"Bench Press"]) {
            [[NSUserDefaults standardUserDefaults] setObject:_benchReps forKey:@"BENCHreps"];
            [[NSUserDefaults standardUserDefaults] setObject:_benchWeight forKey:@"BENCHweight"];
            [self updateStatArrays:_benchReps:_benchWeight];
        }else if ([exercise isEqualToString:@"Squat"]){
            [[NSUserDefaults standardUserDefaults] setObject:_squatsReps forKey:@"SQUATreps"];
            [[NSUserDefaults standardUserDefaults] setObject:_squatsWeight forKey:@"SQUATweight"];
        [self updateStatArrays:_squatsReps:_squatsWeight];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:_deadliftReps forKey:@"DEADLIFTSreps"];
            [[NSUserDefaults standardUserDefaults] setObject:_deadliftWeight forKey:@"DEADLIFTSweight"];
            [self updateStatArrays:_deadliftReps :_deadliftWeight];
        }


    }else{
        self.title = @"Monthly Statistics";

        NSLog(@"BENCH %@",benchMaxWeight);
    }

   
}
- (BOOL)checkIfNewDay{
    NSDate * now = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM dd"];
    NSString *todaysDateString = [dateFormatter stringFromDate:now];
    NSString *lastDayString =[dateFormatter stringFromDate:oldDate];
    
    if (oldDate==nil||![todaysDateString isEqualToString:lastDayString]) {
        return true;
    }else{
        return false;
    }
    
    
    
}
-(void)updateStatArrays:(NSString *)reps :(NSString*)weight{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *tempbenchMaxReps = [userDefaults objectForKey:@"benchmaxreps"];
    benchMaxReps = [NSMutableArray arrayWithArray:tempbenchMaxReps];

    NSArray *tempbenchMaxWeight = [userDefaults objectForKey:@"benchmaxweight"];
    benchMaxWeight = [NSMutableArray arrayWithArray:tempbenchMaxWeight];

    NSArray *tempbenchAvgWeight =[userDefaults objectForKey:@"benchavgweight"];
    benchAvgWeight= [NSMutableArray arrayWithArray:tempbenchAvgWeight];

    NSArray *tempbenchAvgReps=  [userDefaults objectForKey:@"benchavgreps"];
    benchAvgReps = [NSMutableArray arrayWithArray:tempbenchAvgReps];

    NSArray *tempbenchTotReps = [userDefaults objectForKey:@"benchtotreps"];
    benchTotReps = [NSMutableArray arrayWithArray:tempbenchTotReps];

    
    NSString *dateIndexString;
    int repsInt =[reps integerValue];
    int weightInt=[weight integerValue];
    int numSetsToday;
    int index;
    
    dateIndexString=[[NSUserDefaults standardUserDefaults] stringForKey:@"index"];
    index =[dateIndexString integerValue];

    if (dateIndex ==nil) {
        dateIndex=0;
        index=0;
        dateIndexString = [@(index) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:dateIndexString forKey:@"index"];
    }else{
        dateIndexString=[[NSUserDefaults standardUserDefaults] stringForKey:@"index"];
        index =[dateIndexString integerValue];
        dateIndex=&index;
    }
    if([exercise isEqualToString:@"Bench Press"]){
        if (true) {
            dateIndex++;
            numSetsToday=1;
            NSString *setsString=[@(numSetsToday) stringValue];
            [[NSUserDefaults standardUserDefaults] setObject:setsString forKey:@"numOfSets"];
            [benchMaxReps addObject:reps];
            [benchMaxWeight addObject:weight];
            [benchAvgReps addObject:reps];
            [benchAvgWeight addObject:weight];
            [benchTotReps addObject:reps];
        }else{
            NSString*numSetsTodayString=[[NSUserDefaults standardUserDefaults] stringForKey:@"numOfSets"];
            numSetsToday=[numSetsTodayString intValue];
            numSetsToday++;
            int i=[dateIndexString integerValue];
            
            int highestRep=[[benchMaxReps lastObject] intValue];
            if (highestRep<repsInt) {
                [benchMaxReps insertObject:reps atIndex:i];
            }
            int highestWeight=[[benchMaxWeight lastObject] intValue];
            if (highestWeight<weightInt) {
                [benchMaxWeight insertObject:weight atIndex:i];
                
            }
            int averageReps=[[benchAvgReps lastObject] intValue];
            averageReps = (repsInt +averageReps)/numSetsToday;
            NSString *averageRepsString=[@(averageReps) stringValue];
            [benchAvgReps insertObject:averageRepsString atIndex:i];
            int averageWeight=[[benchAvgWeight lastObject] intValue];
            averageWeight = (weightInt +averageWeight)/numSetsToday;
            NSString *averageWeightString=[@(averageWeight) stringValue];
            [benchAvgReps insertObject:averageWeightString atIndex:i];
            int totalReps=[[benchTotReps lastObject] intValue];
            totalReps=totalReps+repsInt;
            NSString *totalString=[@(totalReps) stringValue];
            [benchTotReps insertObject:totalString atIndex:i];
        }
    }

    [userDefaults setObject:benchMaxReps forKey:@"benchmaxreps"];
    [userDefaults setObject:benchMaxWeight forKey:@"benchmaxweight"];
    [userDefaults setObject:benchAvgWeight forKey:@"benchavgweight"];
    [userDefaults setObject:benchAvgReps forKey:@"benchavgreps"];
    [userDefaults setObject:benchTotReps forKey:@"benchtotreps"];
    [userDefaults synchronize];
}

@end