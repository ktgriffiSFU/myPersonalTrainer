
//
//  StatisticsViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-30.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatisticsViewController.h"
#import "DetailWorkoutViewController.h"

@interface StatisticsViewController()
{
    UILabel *_label;

    
}


@end

@implementation StatisticsViewController
@synthesize armsScore,rowNumber;
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


    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"This runs viedidload");

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  

    NSLog(@"Core : %@",coreScore);
    NSLog(@"Legs : %@",legsScore);
    [self gatherData];
    [self postData];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)gatherData
{
    if (_newData) {
        [self createViews];
        self.title= @"Good Set!";
        [[NSUserDefaults standardUserDefaults] setObject:_arms forKey:@"ARMS"];
        [[NSUserDefaults standardUserDefaults] setObject:_legs forKey:@"LEGS"];
        [[NSUserDefaults standardUserDefaults] setObject:_chest forKey:@"CHEST"];
        [[NSUserDefaults standardUserDefaults] setObject:_core forKey:@"CORE"];
        [[NSUserDefaults standardUserDefaults] setObject:_shoulders forKey:@"SHOULDERS"];
        [[NSUserDefaults standardUserDefaults] setObject:_back forKey:@"BACK"];
        [[NSUserDefaults standardUserDefaults] setObject:_daysLeft forKey:@"DAYS"];
    }else{
            self.title = @"Weekly Statistics";
    }
    armsScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"ARMS"];
    legsScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"LEGS"];
    chestScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"CHEST"];
    coreScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"CORE"];
    shoulderScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"SHOULDERS"];
    backScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"BACK"];
    daysScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"DAYS"];

}
-(void)postData{
    shoulderImage.image = [self determineStars:shoulderScore];
    armsImage.image = [self determineStars:armsScore];
    backImage.image = [self determineStars:backScore];
    chestImage.image= [self determineStars:chestScore];
    legsImage.image = [self determineStars:legsScore];
    coreImage.image = [self determineStars:coreScore];
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
- (UIImage *) determineStars: (NSString *) score
{
    UIImage *starValue;
    int scoreInt = [score integerValue];
    if (scoreInt==0) {
        starValue =[UIImage imageNamed:@"0Stars.png"];
    }else if (scoreInt>0 &&scoreInt <29) {
        starValue =[UIImage imageNamed:@"1Stars.png"];
    }else if (scoreInt>=29 &&scoreInt < 59) {
        starValue =[UIImage imageNamed:@"2Stars.png"];
    }else if (scoreInt>=59 &&scoreInt < 99) {
        starValue =[UIImage imageNamed:@"3Stars.png"];
    }else if (scoreInt>=99 &&scoreInt < 200) {
        starValue =[UIImage imageNamed:@"4Stars.png"];
    }else if (scoreInt>=200) {
        starValue =[UIImage imageNamed:@"5Stars.png"];
    }
    return starValue;
}

@end