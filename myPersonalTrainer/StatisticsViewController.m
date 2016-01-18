
//
//  StatisticsViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-30.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatisticsViewController.h"

@interface StatisticsViewController()
{
    UILabel *_label;

    
}
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation StatisticsViewController
@synthesize armsScore;
@synthesize shoulderScore;
@synthesize chestScore;
@synthesize backScore;
@synthesize coreScore;
@synthesize legsScore;
@synthesize armsImage;
@synthesize shoulderImage;
@synthesize chestImage;
@synthesize legsImage;
@synthesize coreImage;
@synthesize backImage;
@synthesize daysToGo;
@synthesize daysScore;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Weekly Statistics";
    self.view.backgroundColor = [UIColor whiteColor];
    [self gatherData];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  

    NSLog(@"Core : %@",coreScore);
    shoulderImage.image = [self determineStars:shoulderScore];
    armsImage.image = [self determineStars:armsScore];
    backImage.image = [self determineStars:backScore];
    chestImage.image= [self determineStars:chestScore];
    legsImage.image = [self determineStars:legsScore];
    coreImage.image = [self determineStars:coreScore];
    if (daysScore== nil){
        [self.daysToGo setText:[NSString stringWithFormat:@"Your statistics reset every week"]];
    }else{
        [self.daysToGo setText:[NSString stringWithFormat:@"Days until reset: %@",daysScore]];
    }

    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)gatherData
{
    if (_newData) {
        CGRect top, bottom;
        CGRectDivide(self.view.bounds, &top, &bottom, self.view.bounds.size.height / 2, CGRectMinYEdge);
        
        _label = [[UILabel alloc] initWithFrame:CGRectInset(top, 5, 5)];
        _label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|
        UIViewAutoresizingFlexibleBottomMargin;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"Good Work, Keep on working out.";
        [self.view addSubview:_label];
        [[NSUserDefaults standardUserDefaults] setObject:_arms forKey:@"ARMS"];
        [[NSUserDefaults standardUserDefaults] setObject:_legs forKey:@"LEGS"];
        [[NSUserDefaults standardUserDefaults] setObject:_chest forKey:@"CHEST"];
        [[NSUserDefaults standardUserDefaults] setObject:_core forKey:@"CORE"];
        [[NSUserDefaults standardUserDefaults] setObject:_shoulders forKey:@"SHOULDERS"];
        [[NSUserDefaults standardUserDefaults] setObject:_back forKey:@"BACK"];
        [[NSUserDefaults standardUserDefaults] setObject:_daysLeft forKey:@"DAYS"];
    }
    armsScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"ARMS"];
    legsScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"LEGS"];
    chestScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"CHEST"];
    coreScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"CORE"];
    shoulderScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"SHOULDERS"];
    backScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"BACK"];
    daysScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"DAYS"];
}

- (UIImage *) determineStars: (NSString *) score
{
    UIImage *starValue;
    int scoreInt = [score integerValue];
    if (scoreInt==0) {
        starValue =[UIImage imageNamed:@"0Stars.png"];
    }if (scoreInt>0 &&scoreInt <29) {
        starValue =[UIImage imageNamed:@"1Stars.png"];
    }if (scoreInt>=29 &&scoreInt < 59) {
        starValue =[UIImage imageNamed:@"2Stars.png"];
    }if (scoreInt>=59 &&scoreInt < 99) {
        starValue =[UIImage imageNamed:@"3Stars.png"];
    }if (scoreInt>=99 &&scoreInt < 200) {
        starValue =[UIImage imageNamed:@"4Stars.png"];
    }if (scoreInt>=200) {
        starValue =[UIImage imageNamed:@"5Stars.png"];
    }
    return starValue;
}
@end