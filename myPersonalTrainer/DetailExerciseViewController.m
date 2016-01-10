
//
//  DetailExerciseViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-21.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "DetailExerciseViewController.h"
#import "StatisticsViewController.h"
#import "ExerciseViewController.h"
@interface DetailExerciseViewController ()<StatisticsViewControllerDelegate>
{
    UILabel *_label;
    UIButton *_button;
}

@end

@implementation DetailExerciseViewController

{
    NSArray *exercises;
    NSArray *pictures;
    NSArray *targetedMuscle;
    NSArray *details;
    NSArray *exerciseName;
    NSArray *thumbnails;
    NSArray *thumbnails2;
    NSArray *workoutNameP;
    NSDictionary *workoutArray;
    NSArray *exercisesforWorkout;
    NSMutableArray *targetedMuscleforWorkout;
    NSMutableArray *thumbnailforWorkout;
    NSMutableArray *thumbnailforWorkout2;
    NSMutableArray *detailsforWorkout;
    NSMutableArray *exerciseforWorkoutNew;
    NSString *armsString;
    NSString *shouldersString, *chestString,*backString,*coreString,*legsString,*totalString;
    int scoreShoulders, scoreChest, scoreBack, scoreArms,scoreCore,scoreLegs;
    int k;
    int rowNumberNew;
    int reset;
    int totalScore;
    NSString *daysToGo;
    NSInteger rowNumberDetails[8];
    NSDate *methodStart;
    NSDate *methodEnd;
    bool newScore;
    NSTimeInterval  *elapsedTime;
    
}

@synthesize tableView; // Add this line of code
@synthesize exerciseImageView;
@synthesize exerciseImageView2;
@synthesize exerciseImageName;
@synthesize exerciseDetails;
@synthesize rowNumberWorkout;
@synthesize rowNumberNew;
@synthesize workoutName;
@synthesize repsText, setsText;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}- (void)createViews
{
    CGRect top, bottom;
    CGRectDivide(self.view.bounds, &top, &bottom, self.view.bounds.size.height / 2, CGRectMinYEdge);

    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(0, 0, 100, 100);
    _button.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    [_button setTitle:@"Submit" forState:UIControlStateNormal];
    _button.center = CGPointMake(CGRectGetMidX(bottom), CGRectGetMidY(bottom));
    [self.view addSubview:_button];
    
    [_button addTarget:self action:@selector(passDataForward) forControlEvents:UIControlEventTouchUpInside];
}
- (void)passDataForward
{
    [self submitButton];
    StatisticsViewController *secondViewController = [[StatisticsViewController alloc] init];
    secondViewController.arms = armsString;
    secondViewController.legs = legsString;
    secondViewController.chest = chestString;
    secondViewController.back = backString;
    secondViewController.shoulders= shouldersString;
    secondViewController.core = coreString;
    secondViewController.newData=newScore;
    secondViewController.daysLeft=daysToGo;
    secondViewController.delegate = self;
   [self.navigationController pushViewController:secondViewController animated:NO];
}

- (void)dataFromController:(NSString *)arms :(bool)newData :(NSString *)shoulders :(NSString *)chest :(NSString *)back :(NSString *)core :(NSString *)legs :(NSString *) daysLeft;
{
    newData=newScore;
    _button.enabled = NO;
}

- (void)submitButton {
    NSInteger repsInt = [repsText.text integerValue];
    NSInteger setsInt = [setsText.text integerValue];
    NSInteger scoreInt = setsInt*repsInt;


    newScore=YES;
    if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"triceps group"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"biceps group, wrist flexors"]) {
        NSInteger oldScoreArms = [armsString integerValue];
        scoreArms = scoreInt+oldScoreArms;
        totalScore +=scoreArms;
        armsString = [@(scoreArms) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:armsString forKey:@"arms"];

    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"anterior deltoids, pectoralis major, triceps group, trapezius"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"deltoid, trapezius"]) {
        NSInteger oldScoreShoulders = [shouldersString integerValue];
        scoreShoulders = scoreInt +oldScoreShoulders;
        totalScore +=scoreShoulders;
        shouldersString = [@(scoreShoulders) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:shouldersString forKey:@"shoulders"];
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"pectoralis major, anterior deltoid, triceps group"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"pectoralis major, anterior deltoid"]) {
        NSInteger oldScoreChest = [chestString integerValue];
        scoreChest = scoreInt +oldScoreChest;
        totalScore +=scoreChest;
        chestString = [@(scoreChest) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:chestString forKey:@"chest"];
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"latissimus dorsi, teres major, posterior deltoid, rhomboids"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"rhomboids, mid-trapezius, latissimus dorsi, teres major"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"levator scapulae, upper trapezius, mid-trapezius, rhomboids"]) {
        NSInteger oldScoreBack =[backString integerValue];
        scoreBack = scoreInt +oldScoreBack;
        totalScore +=scoreBack;
        backString = [@(scoreBack) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:backString forKey:@"back"];
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"erector spinae"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"rectus abdominus, obliques"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"rectus abdominus"]||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"core, hip extensors, sholder flexors, erector spinae"]) {
        NSInteger oldScoreCore = [coreString integerValue];
        scoreCore = scoreInt + oldScoreCore;
        totalScore +=scoreCore;
        coreString = [@(scoreCore) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:coreString forKey:@"core"];
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"quadriceps, hamstrings, glutes"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"quadriceps"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"hamstrings"]||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"hip adductors"]|| [targetedMuscleforWorkout[rowNumberNew] isEqual :@"gastrocnemius, soleus"]) {
        NSInteger oldScoreLegs = [legsString integerValue];
        scoreLegs = scoreInt +oldScoreLegs;
        totalScore +=scoreLegs;
        legsString = [@(scoreLegs) stringValue];
        [[NSUserDefaults standardUserDefaults] setObject:legsString forKey:@"legs"];
    }
  



    totalString = [@(totalScore) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:totalString forKey:@"total"];

   

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        ExerciseViewController *destViewController = segue.destinationViewController;
        destViewController.rowNumber = rowNumberDetails[rowNumberNew];

    }
}
-(void)dismissKeyboard {
    [repsText resignFirstResponder];
    [setsText resignFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    self.adBanner.delegate = self;

    armsString = [[NSUserDefaults standardUserDefaults] stringForKey:@"arms"];
    shouldersString = [[NSUserDefaults standardUserDefaults] stringForKey:@"shoulders"];
    chestString = [[NSUserDefaults standardUserDefaults] stringForKey:@"chest"];
    backString = [[NSUserDefaults standardUserDefaults] stringForKey:@"back"];
    coreString = [[NSUserDefaults standardUserDefaults] stringForKey:@"core"];
    legsString = [[NSUserDefaults standardUserDefaults] stringForKey:@"legs"];
    totalString =[[NSUserDefaults standardUserDefaults] stringForKey:@"total"];
    NSLog(@"Saved:%@",armsString);
    totalScore = [totalString integerValue];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss-dd-MM-yyyy"];
    /* ... Do whatever you need to do ... */
    NSString *dateString = [[NSUserDefaults standardUserDefaults] stringForKey:@"startDate"];
    methodStart = [dateFormatter dateFromString:dateString];
    
    methodEnd= [NSDate date];
    
    NSTimeInterval executionTime = [methodEnd timeIntervalSinceDate:methodStart];
    daysToGo = [self findDaysLeft:&executionTime];
    NSLog(@"executionTime = %f", executionTime);
    if (executionTime >604800 || methodStart == nil) {
        reset=0;
        methodStart = [NSDate date];
        armsString = [@(reset) stringValue];
        chestString =[@(reset) stringValue];
        shouldersString =[@(reset) stringValue];
        backString =[@(reset) stringValue];
        coreString =[@(reset) stringValue];
        legsString =[@(reset) stringValue];
        totalString =[@(reset) stringValue];

        [[NSUserDefaults standardUserDefaults] setObject:armsString forKey:@"arms"];
        [[NSUserDefaults standardUserDefaults] setObject:chestString forKey:@"chest"];
        [[NSUserDefaults standardUserDefaults] setObject:backString forKey:@"back"];
        [[NSUserDefaults standardUserDefaults] setObject:coreString forKey:@"core"];
        [[NSUserDefaults standardUserDefaults] setObject:legsString forKey:@"legs"];
        [[NSUserDefaults standardUserDefaults] setObject:totalString forKey:@"total"];
        [[NSUserDefaults standardUserDefaults] setObject:shouldersString forKey:@"shoulders"];

        NSString *stringDate = [dateFormatter stringFromDate:[NSDate date]];
        [[NSUserDefaults standardUserDefaults] setObject:stringDate forKey:@"startDate"];

    }

    // Initially hide the ad banner.
    self.adBanner.alpha = 0.0;
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"Workouts" ofType:@"plist"];
    // Load the file content and read the data into arrays
    NSDictionary *dict1 = [[NSDictionary alloc] initWithContentsOfFile:path1];
    NSDictionary *dict2 = [[NSDictionary alloc] initWithContentsOfFile:path2];
    workoutNameP = [dict2 objectForKey:@"WorkoutName"];

    self.workoutName.text =[workoutNameP objectAtIndex:rowNumberWorkout];
    // Find out the path of recipes.plist
    exerciseName = [dict1 objectForKey:@"ExerciseName"];
    thumbnails = [dict1 objectForKey:@"Thumbnail"];
    thumbnails2= [dict1 objectForKey:@"Thumbnail2"];
    targetedMuscle = [dict1 objectForKey:@"TargetedMuscle"];
    workoutArray= [dict2 objectForKey:@"WorkoutArray"];
    details = [dict1 objectForKey:@"Details"];
    exercisesforWorkout =[workoutArray objectForKey:workoutNameP[rowNumberWorkout]];
    targetedMuscleforWorkout = [[NSMutableArray alloc] init];
    thumbnailforWorkout = [[NSMutableArray alloc] init];
    thumbnailforWorkout2= [[NSMutableArray alloc] init];
    detailsforWorkout = [[NSMutableArray alloc] init];
    exerciseforWorkoutNew =[[NSMutableArray alloc] init];
    k=0;
    //Need to do thumbnail, targeted muscle.
    for (int j=0;j<exerciseName.count ; j++) {
        for (int i=0; i <exercisesforWorkout.count; i++) {
            if ([exercisesforWorkout[i] isEqualToString:exerciseName[j]]) {
               // NSLog(@"Exercise: %@",exercisesforWorkout[i]);
                rowNumberDetails[k]= j;
                k++;
                NSString *tempMuscle = [targetedMuscle objectAtIndex:j];
                NSString *tempThumb = [thumbnails objectAtIndex:j];
                NSString *tempThumb2 = [thumbnails2 objectAtIndex:j];
                NSString *tempDetail= [details objectAtIndex:j];
                NSString *tempExercise = [exercisesforWorkout objectAtIndex:i];
                [targetedMuscleforWorkout addObject:tempMuscle];
                [thumbnailforWorkout addObject:tempThumb];
                [thumbnailforWorkout2 addObject:tempThumb2];
                [exerciseforWorkoutNew addObject:tempExercise];
                [detailsforWorkout addObject:tempDetail];
               // NSLog(@"target: %@",targetedMuscleforWorkout);
                
            }
        }
    }
   

    self.exerciseImageView.image = [UIImage imageNamed:[thumbnailforWorkout objectAtIndex:rowNumberNew]];
    self.exerciseImageView2.image= [UIImage imageNamed:[thumbnailforWorkout2 objectAtIndex:rowNumberNew]];
    self.exerciseImageName.text =[exerciseforWorkoutNew objectAtIndex:rowNumberNew];
    self.exerciseDetails.text =[detailsforWorkout objectAtIndex:rowNumberNew];
   // NSLog(@"Exercise is: %@",exerciseImageName);
    [self createViews];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    
    // Show the ad banner.
    [UIView animateWithDuration:0.5 animations:^{
        self.adBanner.alpha = 1.0;
    }];
}
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
}
-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    return YES;
}
-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Unable to show ads. Error: %@", [error localizedDescription]);
    // Hide the ad banner.
    [UIView animateWithDuration:0.5 animations:^{
        self.adBanner.alpha = 0.0;
    }];
}
-(NSString*)findDaysLeft:(NSTimeInterval *) timeElapsed{
    NSString *dayString;
    int seconds = round(*timeElapsed);
    int daysPassed = seconds/86400;
    int days = 7-daysPassed;
    if (timeElapsed==nil) {
        dayString = @"Go Workout!";
    }else{
        dayString= [@(days) stringValue];
    }
    return dayString;
}


@end

