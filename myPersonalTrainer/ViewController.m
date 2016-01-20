//
//  ViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2016-01-19.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *exercises;
    NSArray *pictures;
    NSArray *pictures2;
    NSArray *details;
}
@synthesize exerciseImageView;
@synthesize exerciseImageView2;
@synthesize exerciseDetails;
@synthesize rowNumber;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)initView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    exercises = [dict objectForKey:@"ExerciseName"];
    pictures = [dict objectForKey:@"Thumbnail"];
    pictures2 = [dict objectForKey:@"Thumbnail2"];
    details = [dict objectForKey:@"Details"];
    self.exerciseImageView.image = [UIImage imageNamed:[pictures objectAtIndex:rowNumber]];
    self.exerciseImageView2.image = [UIImage imageNamed:[pictures2 objectAtIndex:rowNumber]];
    self.exerciseDetails.text =[details objectAtIndex:rowNumber];
    self.title = [exercises objectAtIndex:rowNumber];
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

