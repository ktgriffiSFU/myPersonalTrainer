//
//  DetailExerciseViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-21.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "StatisticsViewController.h"
@interface DetailExerciseViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;

@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView2;

@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property int rowNumberNew;
@property int rowNumberWorkout;

@property (weak, nonatomic) IBOutlet UITextField *repsText;
@property (weak, nonatomic) IBOutlet UITextField *setsText;
//@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end
