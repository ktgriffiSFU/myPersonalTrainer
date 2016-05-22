
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
    


    self.view.backgroundColor = [UIColor whiteColor];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  
    [self gatherData];
    [self createStarViews];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)gatherData
{
    if (_newData) {
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

}
-(void)createStarViews{
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
    
    //make the Star images
    UIImageView *armsStarsImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenwidth/2.7,screenheight*3/16,screenwidth/1.9,screenheight/16)];
    UIImageView *shoulderStarsImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenwidth/2.7,screenheight*5/16,screenwidth/1.9,screenheight/16)];
    UIImageView *chestStarsImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenwidth/2.7,screenheight*7/16,screenwidth/1.9,screenheight/16)];
    UIImageView *backStarsImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenwidth/2.7,screenheight*9/16,screenwidth/1.9,screenheight/16)];
    UIImageView *coreStarsImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenwidth/2.7,screenheight*11/16,screenwidth/1.9,screenheight/16)];
    UIImageView *legsStarsImage =[[UIImageView alloc] initWithFrame:CGRectMake(screenwidth/2.7,screenheight*13/16,screenwidth/1.9,screenheight/16)];

    shoulderStarsImage.image=[self determineStars:shoulderScore];
    armsStarsImage.image=[self determineStars:armsScore];
    backStarsImage.image = [self determineStars:backScore];
    chestStarsImage.image= [self determineStars:chestScore];
    legsStarsImage.image = [self determineStars:legsScore];
    coreStarsImage.image = [self determineStars:coreScore];
    [self.view addSubview:shoulderStarsImage];
    [self.view addSubview:armsStarsImage];
    [self.view addSubview:backStarsImage];
    [self.view addSubview:chestStarsImage];
    [self.view addSubview:legsStarsImage];
    [self.view addSubview:coreStarsImage];
    //Make the labels
    UILabel *armLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,screenheight*3/16,screenwidth/1.9,screenheight/16)];
    UILabel *shoulderLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,screenheight*5/16,screenwidth/1.9,screenheight/16)];
    UILabel *chestLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,screenheight*7/16,screenwidth/1.9,screenheight/16)];
    UILabel *backLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,screenheight*9/16,screenwidth/1.9,screenheight/16)];
    UILabel *coreLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,screenheight*11/16,screenwidth/1.9,screenheight/16)];
    UILabel *legsLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,screenheight*13/16,screenwidth/1.9,screenheight/16)];

    armLabel.text=@"Arms";
    shoulderLabel.text=@"Shoulders";
    chestLabel.text=@"Chest";
    backLabel.text=@"Back";
    coreLabel.text=@"Core";
    legsLabel.text=@"Legs";

    [armLabel setFont:[UIFont fontWithName:@"Avenir" size:17]];
    [shoulderLabel setFont:[UIFont fontWithName:@"Avenir" size:17]];
    [backLabel setFont:[UIFont fontWithName:@"Avenir" size:17]];
    [chestLabel setFont:[UIFont fontWithName:@"Avenir" size:17]];
    [coreLabel setFont:[UIFont fontWithName:@"Avenir" size:17]];
    [legsLabel setFont:[UIFont fontWithName:@"Avenir" size:17]];

    armLabel.textAlignment = NSTextAlignmentLeft;
    backLabel.textAlignment = NSTextAlignmentLeft;
    shoulderLabel.textAlignment = NSTextAlignmentLeft;
    chestLabel.textAlignment = NSTextAlignmentLeft;
    legsLabel.textAlignment = NSTextAlignmentLeft;
    coreLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:armLabel];
    [self.view addSubview:shoulderLabel];
    [self.view addSubview:coreLabel];
    [self.view addSubview:backLabel];
    [self.view addSubview:chestLabel];
    [self.view addSubview:armLabel];
    [self.view addSubview:legsLabel];

}

- (UIImage *) determineStars: (NSString *) score
{
    UIImage *starValue;
    int scoreInt = [score intValue];
    NSString *maxRepsString=[[NSUserDefaults standardUserDefaults]objectForKey:@"repWeekGoal"];
    int maxRepsInt=[maxRepsString intValue];
    if (scoreInt==0) {
        starValue =[UIImage imageNamed:@"0Stars.png"];
    }else if (scoreInt>0 &&scoreInt <maxRepsInt*.4) {
        starValue =[UIImage imageNamed:@"1Stars.png"];
    }else if (scoreInt>=maxRepsInt*.4 &&scoreInt < maxRepsInt*.6) {
        starValue =[UIImage imageNamed:@"2Stars.png"];
    }else if (scoreInt>=maxRepsInt*.6 &&scoreInt < maxRepsInt*.8) {
        starValue =[UIImage imageNamed:@"3Stars.png"];
    }else if (scoreInt>=maxRepsInt*.8 &&scoreInt < maxRepsInt) {
        starValue =[UIImage imageNamed:@"4Stars.png"];
    }else if (scoreInt>=maxRepsInt) {
        starValue =[UIImage imageNamed:@"5Stars.png"];
    }
    return starValue;
}
-(void)infoView{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"View Weekly Statistics"
                          message:@"Each time you enter a workout; the amount of reps that you recorded will be organized by muscle worked. By the end of the week the goal is to have 5 Stars for every muscle group. After a week, the stars are reset and you try again"
                          delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
    
    
}
@end