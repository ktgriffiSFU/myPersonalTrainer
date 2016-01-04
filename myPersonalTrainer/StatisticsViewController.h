
//
//  StatisticsViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-30.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DetailExerciseViewController.h"

@interface StatisticsViewController : UIViewController <DetailExerciseViewControllerDelegate>
@property (nonatomic) NSString* shoulderScore;
@property (nonatomic) NSString* chestScore;
@property (nonatomic) NSString* backScore;
@property (nonatomic) NSString* armsScore;
@property (nonatomic) NSString* coreScore;
@property (nonatomic) NSString* legsScore;




@end