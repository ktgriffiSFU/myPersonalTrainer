
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
#import "ViewController.h"
@interface DetailExerciseViewController ()<StatisticsViewControllerDelegate>
{
    UILabel *_label;
    UITextField *repsField;
    UITextField *setsField;
}

@end


@implementation DetailExerciseViewController


{
    NSArray *exercises,*pictures;
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
    bool newScore;
    NSTimeInterval  *elapsedTime;
    
}

@synthesize exerciseImageView;
@synthesize exerciseImageView2;
//@synthesize exerciseDetails;
@synthesize rowNumberWorkout;
@synthesize rowNumberNew;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
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
    secondViewController.delegate = self;
    secondViewController.rowNumber =&(rowNumberNew);
   [self.navigationController pushViewController:secondViewController animated:NO];
}

- (void)dataFromController:(NSString *)arms :(bool)newData :(NSString *)shoulders :(NSString *)chest :(NSString *)back :(NSString *)core :(NSString *)legs :(NSString *) daysLeft;
{
    newData=newScore;
}

- (void)submitButton {
    NSInteger repsInt = [repsField.text integerValue];
    NSInteger setsInt = [setsField.text integerValue];
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
        ViewController *destViewController = segue.destinationViewController;
        destViewController.rowNumber = rowNumberDetails[rowNumberNew];

    }
}
-(void)dismissKeyboard {
    [repsField resignFirstResponder];
    [setsField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];


    [repsField setDelegate:self];
    [setsField setDelegate:self];

    armsString = [[NSUserDefaults standardUserDefaults] stringForKey:@"arms"];
    shouldersString = [[NSUserDefaults standardUserDefaults] stringForKey:@"shoulders"];
    chestString = [[NSUserDefaults standardUserDefaults] stringForKey:@"chest"];
    backString = [[NSUserDefaults standardUserDefaults] stringForKey:@"back"];
    coreString = [[NSUserDefaults standardUserDefaults] stringForKey:@"core"];
    legsString = [[NSUserDefaults standardUserDefaults] stringForKey:@"legs"];
    totalString =[[NSUserDefaults standardUserDefaults] stringForKey:@"total"];
    NSLog(@"Saved:%@",armsString);
    totalScore = [totalString integerValue];

    
    

    if ([self checkIfNewWeek]) {
        reset=0;
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
        
    }

    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"Workouts" ofType:@"plist"];
    // Load the file content and read the data into arrays
    NSDictionary *dict1 = [[NSDictionary alloc] initWithContentsOfFile:path1];
    NSDictionary *dict2 = [[NSDictionary alloc] initWithContentsOfFile:path2];
    workoutNameP = [dict2 objectForKey:@"WorkoutName"];

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

    [self createViews];

}
-(void)showDetails{
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}
- (BOOL)checkIfNewWeek{
    NSString *dateString = [[NSUserDefaults standardUserDefaults] stringForKey:@"oldDate"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"MMdd"];
    NSDate *currentDate = [NSDate date];
    NSDate *oldDate = [dateFormatter dateFromString:dateString];
    NSDateComponents *comp = [[NSDateComponents alloc] init];
    [comp setWeekday:7];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDate *resetDate=[calendar dateByAddingComponents:comp toDate:oldDate options:0];
    NSString *lastDayString =[dateFormatter stringFromDate:currentDate];


    if(resetDate<=currentDate ||dateString==nil){
    [[NSUserDefaults standardUserDefaults] setObject:lastDayString forKey:@"oldDate"];
        return true;
    }else{
        return false;
    }
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) createViews{
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight=[UIScreen mainScreen].bounds.size.height;
    NSLog(@"ScreenWidth: %f",screenwidth);
    CGFloat width = screenwidth/2;
    CGFloat yValue=(100.0+width);

    UIImageView *image1 =[[UIImageView alloc] initWithFrame:CGRectMake(0,67,width,width)];
    UIImageView *image2 =[[UIImageView alloc] initWithFrame:CGRectMake(width,67, width,width)];
    image1.image=[UIImage imageNamed:[thumbnailforWorkout objectAtIndex:rowNumberNew]];
    image2.image=[UIImage imageNamed:[thumbnailforWorkout2 objectAtIndex:rowNumberNew]];
    [self.view addSubview:image1];
    [self.view addSubview:image2];
    
    self.exerciseImageView.image = [UIImage imageNamed:[thumbnailforWorkout objectAtIndex:rowNumberNew]];
    self.exerciseImageView2.image= [UIImage imageNamed:[thumbnailforWorkout2 objectAtIndex:rowNumberNew]];
    

    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self
                action:@selector(passDataForward)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"SUBMIT" forState:UIControlStateNormal];
    button1.frame = CGRectMake(0, yValue+200, screenwidth, 60.0);
    [button1 setBackgroundColor:[UIColor redColor]];
    button1.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];

    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 addTarget:self
                action:@selector(showDetails)
      forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"DETAILS" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    
    button2.frame = CGRectMake(0, yValue +100, screenwidth, 60.0);
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];

    [self.view addSubview:button2];
    CGRect frame = CGRectMake(50.0, yValue-25, screenwidth-100, 30);
    repsField = [[UITextField alloc] initWithFrame:frame];
    repsField.borderStyle = UITextBorderStyleRoundedRect;
    repsField.textColor = [UIColor blackColor];
    repsField.font = [UIFont systemFontOfSize:17.0];
    repsField.placeholder = @"REPS";
    repsField.backgroundColor = [UIColor clearColor];
    repsField.autocorrectionType = UITextAutocorrectionTypeYes;
    repsField.keyboardType = UIKeyboardTypeDefault;
    repsField.clearButtonMode = UITextFieldViewModeWhileEditing;
    repsField.delegate = self;
    repsField.textAlignment = UITextAlignmentCenter;
    [repsField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:repsField];
    
    CGRect frame2 = CGRectMake(50.0, yValue+25, screenwidth-100.0, 30);
    setsField = [[UITextField alloc] initWithFrame:frame2];
    setsField.borderStyle = UITextBorderStyleRoundedRect;
    setsField.textColor = [UIColor blackColor];
    setsField.font = [UIFont systemFontOfSize:17.0];
    setsField.placeholder = @"SETS";
    setsField.backgroundColor = [UIColor clearColor];
    setsField.autocorrectionType = UITextAutocorrectionTypeYes;
    setsField.keyboardType = UIKeyboardTypeDefault;
    setsField.clearButtonMode = UITextFieldViewModeWhileEditing;
    setsField.delegate = self;
    setsField.textAlignment = UITextAlignmentCenter;
    [setsField setKeyboardType:UIKeyboardTypeNumberPad];

    [self.view addSubview:setsField];
}
@end

