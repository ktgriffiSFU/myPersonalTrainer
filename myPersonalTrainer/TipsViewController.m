//
//  TipsViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-24.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import "TipsViewController.h"
#include <stdlib.h>
@interface TipsViewController ()

@end

@implementation TipsViewController
{
    NSArray *tips;
    int tipIndex;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Today's Tip";

    // Do any additional setup after loading the view, typically from a nib.
    // Make self the delegate of the ad banner.
    self.adBanner.delegate = self;
    
    // Initially hide the ad banner.
    self.adBanner.alpha = 0.0;
    [self RandomTipGenerator];
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
-(void)RandomTipGenerator{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Tips" ofType:@"plist"];
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    tips = [dict objectForKey:@"Tips"];
    tipIndex = arc4random() %7;
    self.tipLabel.text = [tips objectAtIndex:tipIndex];
    
}


@end