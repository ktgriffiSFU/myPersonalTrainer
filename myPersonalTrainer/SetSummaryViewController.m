

//
//  SetSummaryViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-02.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SetSummaryViewController.h"
#import "SetSummaryCell.h"
#import "DetailExerciseViewController.h"
@interface SetSummaryViewController()<StatisticsViewControllerDelegate>

@end

@implementation SetSummaryViewController
{
    
    int count;
    NSArray *exercises,*reps,*weights,*muscles;
    NSString *shouldersString, *chestString,*backString,*coreString,*legsString,*armsString;
    bool newScore;


}
@synthesize tableView; // Add this line of code
@synthesize repsNew,weightNew,exercise,muscle;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *infoImage=[UIImage imageNamed:@"info.png"];
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc]
                                   initWithImage:infoImage
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(infoView)];
    self.navigationItem.rightBarButtonItem = infoButton;

}
-(NSArray *)getSets :(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *tempArray = [userDefaults objectForKey:key];
    NSMutableArray* itemArray  = [NSMutableArray arrayWithArray:tempArray];

    NSArray *array=[itemArray copy];
    return array;
}
-(void)updateSets :(NSString *)key :(NSString *)value{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSMutableArray* itemArray  = [NSMutableArray arrayWithArray:tempArray];
    if (itemArray==nil) {
        itemArray=[[NSMutableArray alloc] init];
    }
    if (_newData) {
        [itemArray addObject:value];
        
        [userDefaults setObject:itemArray forKey:key];
    }
}
-(void)viewDidAppear:(BOOL)animated{
  //  NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [super viewDidAppear:animated];
    [self updateSets:@"exercisesArray" :exercise];
    [self updateSets:@"repsArray" :repsNew];
    [self updateSets:@"weightsArray" :weightNew];
    [self updateSets:@"musclesArray" :muscle];
   
    

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    exercises = [self getSets:@"exercisesArray"];

    return [exercises count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SetSummaryCell";
    
    SetSummaryCell *cell = (SetSummaryCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SetSummaryCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    reps = [self getSets:@"repsArray"];
    weights = [self getSets:@"weightsArray"];
    muscles = [self getSets:@"musclesArray"];
    NSArray *reversedReps= [[reps reverseObjectEnumerator]allObjects];
    NSArray *reversedWeight=[[weights reverseObjectEnumerator]allObjects];
    NSArray *reversedExercises=[[exercises reverseObjectEnumerator]allObjects];
    cell.exerciseLabel.text=[reversedExercises objectAtIndex:indexPath.row];
    cell.repsLabel.text=[reversedReps objectAtIndex:indexPath.row];
    cell.weightLabel.text=[reversedWeight objectAtIndex:indexPath.row];
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self
                action:@selector(passDataForward)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"SUBMIT" forState:UIControlStateNormal];
    button1.frame = CGRectMake(0,0, screenwidth,40 );
    [button1 setBackgroundColor:[UIColor redColor]];
    button1.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    
    
    CGRect frame = self.tableView.frame;
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-60, 10, 50, 30)];
    addButton.titleLabel.text = @"+";
    addButton.backgroundColor = [UIColor greenColor];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    title.text = @"Reminders";
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [headerView addSubview:button1];
    
    return headerView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
    
}
- (void)passDataForward
{
    [self upDateMuscleCount];
    StatisticsViewController *secondViewController = [[StatisticsViewController alloc] init];
    secondViewController.arms = armsString;
    secondViewController.legs = legsString;
    secondViewController.chest = chestString;
    secondViewController.back = backString;
    secondViewController.shoulders= shouldersString;
    secondViewController.core = coreString;
    secondViewController.newData=true;
    secondViewController.delegate = self;
   // secondViewController.rowNumber =&(rowNumberNew);
   
    [self.navigationController pushViewController:secondViewController animated:NO];
}
- (void)dataFromController:(bool)newData;
{
    newData=newScore;
}
-(void)upDateMuscleCount{
    for (int i=0; i<[exercises count]; i++) {
        NSString *myMuscle = [muscles objectAtIndex:i];
        NSString *repCount = [reps objectAtIndex:i];
        [self addRepsForElement:repCount :myMuscle];
    }
    [self deleteArray:@"exercisesArray"];
    [self deleteArray:@"repsArray"];
    [self deleteArray:@"weightsArray"];
    [self deleteArray:@"musclesArray"];
}

-(void)addRepsForElement :(NSString *)repCount :(NSString *)muscleValue{
    armsString =[[NSUserDefaults standardUserDefaults] objectForKey:@"arms"];
    shouldersString=[[NSUserDefaults standardUserDefaults]objectForKey:@"shoulders"];
    chestString =[[NSUserDefaults standardUserDefaults] objectForKey:@"chest"];
    backString = [[NSUserDefaults standardUserDefaults] objectForKey:@"back"];
    coreString = [[NSUserDefaults standardUserDefaults] objectForKey:@"core"];
    legsString = [[NSUserDefaults standardUserDefaults] objectForKey:@"legs"];
    NSInteger repsInt=[repCount integerValue];
    
    
    if ([muscleValue isEqual:@"triceps group"] ||[muscleValue isEqual:@"biceps group, wrist flexors"]) {
        NSInteger oldScoreArms = [armsString integerValue];
        NSInteger scoreArms = repsInt+oldScoreArms;
        armsString = [@(scoreArms) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:armsString forKey:@"arms"];
        
    }if ([muscleValue isEqual:@"anterior deltoids, pectoralis major, triceps group, trapezius"] ||[muscleValue isEqual:@"deltoid, trapezius"]) {
        NSInteger oldScoreShoulders = [shouldersString integerValue];
        NSInteger scoreShoulders = repsInt +oldScoreShoulders;
        shouldersString = [@(scoreShoulders) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:shouldersString forKey:@"shoulders"];
    }if ([muscleValue isEqual:@"pectoralis major, anterior deltoid, triceps group"] ||[muscleValue isEqual:@"pectoralis major, anterior deltoid"]) {
        NSInteger oldScoreChest = [chestString integerValue];
        NSInteger scoreChest = repsInt +oldScoreChest;
        chestString = [@(scoreChest) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:chestString forKey:@"chest"];
    }if ([muscleValue isEqual:@"latissimus dorsi, teres major, posterior deltoid, rhomboids"] ||[muscleValue isEqual:@"rhomboids, mid-trapezius, latissimus dorsi, teres major"] ||[muscleValue isEqual:@"levator scapulae, upper trapezius, mid-trapezius, rhomboids"]) {
        NSInteger oldScoreBack =[backString integerValue];
        NSInteger scoreBack = repsInt +oldScoreBack;
        backString = [@(scoreBack) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:backString forKey:@"back"];
    }if ([muscleValue isEqual:@"erector spinae"] ||[muscleValue isEqual:@"rectus abdominus, obliques"] ||[muscleValue isEqual:@"rectus abdominus"]||[muscleValue isEqual:@"core, hip extensors, sholder flexors, erector spinae"]) {
        NSInteger oldScoreCore = [coreString integerValue];
        NSInteger scoreCore = repsInt + oldScoreCore;
        coreString = [@(scoreCore) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:coreString forKey:@"core"];
    }if ([muscleValue isEqual:@"quadriceps, hamstrings, glutes"] ||[muscleValue isEqual:@"quadriceps"] ||[muscleValue isEqual:@"hamstrings"]||[muscleValue isEqual:@"hip adductors"]|| [muscleValue isEqual :@"gastrocnemius, soleus"]) {
        NSInteger oldScoreLegs = [legsString integerValue];
        NSInteger scoreLegs = repsInt +oldScoreLegs;
        legsString = [@(scoreLegs) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:legsString forKey:@"legs"];
    }
}
-(void)deleteArray :(NSString *)key{
    NSArray *emptyArray=[[NSArray alloc]init];
    [[NSUserDefaults standardUserDefaults] setObject:emptyArray forKey:key];
}
-(void)infoView{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"View Workout Summary"
                          message:@"After doing a set, view your results here. This catalogue of sets updates every time you complete an entry. At the end of workout you can submit your sets to calculate Weekly Statistics."
                          delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
    
    
}
@end