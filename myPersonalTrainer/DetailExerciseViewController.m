
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
    NSArray *workoutNameP;
    NSDictionary *workoutArray;
    NSArray *exercisesforWorkout;
    NSMutableArray *targetedMuscleforWorkout;
    NSMutableArray *thumbnailforWorkout;
    NSMutableArray *detailsforWorkout;
    NSMutableArray *exerciseforWorkoutNew;
    NSString *armsString;
    NSString *shouldersString, *chestString,*backString,*coreString,*legsString,*totalString;
    int scoreShoulders, scoreChest, scoreBack, scoreArms,scoreCore,scoreLegs;
    int k;
    int rowNumberNew;
    int reset;
    int totalScore;
    NSInteger rowNumberDetails[8];
    NSDate *methodStart;
    NSDate *methodEnd;
    bool newScore;
    
}

@synthesize tableView; // Add this line of code
@synthesize exerciseImageView;
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

    _label = [[UILabel alloc] initWithFrame:CGRectInset(top, 5, 5)];
    _label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|
    UIViewAutoresizingFlexibleBottomMargin;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = armsString;
    [self.view addSubview:_label];

    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(0, 0, 300, 100);
    _button.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|
    UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    [_button setTitle:@"Send Data Forward" forState:UIControlStateNormal];
    _button.center = CGPointMake(CGRectGetMidX(bottom), CGRectGetMidY(bottom));
    [self.view addSubview:_button];
    
    [_button addTarget:self action:@selector(passDataForward) forControlEvents:UIControlEventTouchUpInside];
}
- (void)passDataForward
{
    [self submitButton];
    newScore = YES;
    StatisticsViewController *secondViewController = [[StatisticsViewController alloc] init];
    secondViewController.arms = armsString;
    secondViewController.newData = &(newScore);
    secondViewController.delegate = self;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)dataFromController:(NSString *)arms :(bool)newData :(NSString *)shoulders :(NSString *)chest :(NSString *)back :(NSString *)core :(NSString *)legs;
{
    _label.text = arms;
    newData= newScore;
    _button.enabled = NO;
}

- (void)submitButton {
    newScore = NO;
    NSInteger repsInt = [repsText.text integerValue];
    NSInteger setsInt = [setsText.text integerValue];
    NSInteger scoreInt = setsInt*repsInt;
    
    if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"triceps group"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"biceps group, wrist flexors"]) {
        NSInteger oldScoreArms = [armsString integerValue];
        scoreArms = scoreInt+oldScoreArms;
        totalScore +=scoreArms;
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"anterior deltoids, pectoralis major, triceps group, trapezius"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"deltoid, trapezius"]) {
        NSInteger oldScoreShoulders = [shouldersString integerValue];
        scoreShoulders = scoreInt +oldScoreShoulders;
        totalScore +=scoreShoulders;
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"pectoralis major, anterior deltoid, triceps group"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"pectoralis major, anterior deltoid"]) {
        NSInteger oldScoreChest = [chestString integerValue];
        scoreChest = scoreInt +oldScoreChest;
        totalScore +=scoreChest;
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"latissimus dorsi, teres major, posterior deltoid, rhomboids"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"rhomboids, mid-trapezius, latissimus dorsi, teres major"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"levator scapulae, upper trapezius, mid-trapezius, rhomboids"]) {
        NSInteger oldScoreBack =[backString integerValue];
        scoreBack = scoreInt +oldScoreBack;
        totalScore +=scoreBack;
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"erector spinae"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"rectus abdominus, obliques"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"rectus abdominus"]||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"core, hip extensors, sholder flexors, erector spinae"]) {
        NSInteger oldScoreCore = [coreString integerValue];
        scoreCore = scoreInt + oldScoreCore;
        totalScore +=scoreCore;
    }if ([targetedMuscleforWorkout[rowNumberNew] isEqual:@"quadriceps, hamstrings, glutes"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"quadriceps"] ||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"hamstrings"]||[targetedMuscleforWorkout[rowNumberNew] isEqual:@"hip adductors"]|| [targetedMuscleforWorkout[rowNumberNew] isEqual :@"gastrocnemius, soleus"]) {
        NSInteger oldScoreLegs = [legsString integerValue];
        scoreLegs = scoreInt +oldScoreLegs;
        totalScore +=scoreLegs;
    }
    armsString = [@(scoreArms) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:armsString forKey:@"arms"];
    shouldersString = [@(scoreShoulders) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:shouldersString forKey:@"shoulders"];
    chestString = [@(scoreChest) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:chestString forKey:@"chest"];
    backString = [@(scoreBack) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:backString forKey:@"back"];
    coreString = [@(scoreCore) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:coreString forKey:@"core"];
    legsString = [@(scoreLegs) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:backString forKey:@"legs"];
    totalString = [@(totalScore) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:totalString forKey:@"total"];

   

}

- (IBAction)detailButton:(UIButton *)sender {

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        ExerciseViewController *destViewController = segue.destinationViewController;
        destViewController.rowNumber = rowNumberDetails[rowNumberNew];

    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
    NSLog(@"executionTime = %f", executionTime);
    if (executionTime >199999) {
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
    targetedMuscle = [dict1 objectForKey:@"TargetedMuscle"];
    workoutArray= [dict2 objectForKey:@"WorkoutArray"];
    details = [dict1 objectForKey:@"Details"];
    exercisesforWorkout =[workoutArray objectForKey:workoutNameP[rowNumberWorkout]];
    targetedMuscleforWorkout = [[NSMutableArray alloc] init];
    thumbnailforWorkout = [[NSMutableArray alloc] init];
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
                NSString *tempDetail= [details objectAtIndex:j];
                NSString *tempExercise = [exercisesforWorkout objectAtIndex:i];
                [targetedMuscleforWorkout addObject:tempMuscle];
                [thumbnailforWorkout addObject:tempThumb];
                [exerciseforWorkoutNew addObject:tempExercise];
                [detailsforWorkout addObject:tempDetail];
               // NSLog(@"target: %@",targetedMuscleforWorkout);
                
            }
        }
    }
   

    self.exerciseImageView.image = [UIImage imageNamed:[thumbnailforWorkout objectAtIndex:rowNumberNew]];
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


@end

