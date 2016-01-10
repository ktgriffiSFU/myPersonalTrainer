
//
//  ExerciseViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-28.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseViewController.h"
@interface ExerciseViewController ()

@end

@implementation ExerciseViewController

{
    NSArray *exercises;
    NSArray *pictures;
    NSArray *pictures2;
    NSArray *targetedMuscle;
    NSArray *details;
}


@synthesize exerciseImageView;
@synthesize exerciseImageView2;
//@synthesize exerciseImageName;
@synthesize exerciseDetails;
@synthesize rowNumber;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    exercises = [dict objectForKey:@"ExerciseName"];
    pictures = [dict objectForKey:@"Thumbnail"];
    pictures2 = [dict objectForKey:@"Thumbnail2"];
    targetedMuscle = [dict objectForKey:@"TargetedMuscle"];
    details = [dict objectForKey:@"Details"];
    
   


    self.exerciseImageView.image = [UIImage imageNamed:[pictures objectAtIndex:rowNumber]];
    self.exerciseImageView2.image = [UIImage imageNamed:[pictures2 objectAtIndex:rowNumber]];
//    self.exerciseImageName.text =[exercises objectAtIndex:rowNumber];
    self.exerciseDetails.text =[details objectAtIndex:rowNumber];
    self.title = [exercises objectAtIndex:rowNumber];

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Make self the delegate of the ad banner.
    self.adBanner.delegate = self;
    
    // Initially hide the ad banner.
    self.adBanner.alpha = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad Banner will load ad.");
    
    // Show the ad banner.
    [UIView animateWithDuration:0.5 animations:^{
        self.adBanner.alpha = 1.0;
    }];
}
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad Banner did load ad.");
}
-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    NSLog(@"Ad Banner action is about to begin.");
    return YES;
}
-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
    NSLog(@"Ad Banner action did finish");
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Unable to show ads. Error: %@", [error localizedDescription]);
    // Hide the ad banner.
    [UIView animateWithDuration:0.5 animations:^{
        self.adBanner.alpha = 0.0;
    }];
}



@end
