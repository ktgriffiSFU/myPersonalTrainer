
//
//  StatisticsViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-30.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol StatisticsViewControllerDelegate <NSObject>

@required
- (void)dataFromController:(bool)newData;

@end
@interface StatisticsViewController : UIViewController

@property (nonatomic, retain) NSString *arms;
@property (nonatomic, retain) NSString *shoulders;
@property (nonatomic, retain) NSString *chest;
@property (nonatomic, retain) NSString *back;
@property (nonatomic, retain) NSString *core;
@property (nonatomic, retain) NSString *legs;
@property (nonatomic) bool newData;
@property (nonatomic) NSString *daysLeft;
@property (nonatomic, weak) id<StatisticsViewControllerDelegate> delegate;
@property (nonatomic) NSString* shoulderScore;
@property (nonatomic) NSString* chestScore;
@property (nonatomic) NSString* backScore;
@property (nonatomic) NSString* armsScore;
@property (nonatomic) NSString* coreScore;
@property (nonatomic) NSString* legsScore;
@property (nonatomic) NSString* daysScore;
@property (nonatomic) int*rowNumber;








@end