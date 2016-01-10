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
@interface DetailExerciseViewController : UIViewController <ADBannerViewDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;

@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView2;
@property (weak, nonatomic) IBOutlet UILabel *exerciseImageName;
@property (weak, nonatomic) IBOutlet UILabel *exerciseDetails;
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *workoutName;
@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property int rowNumberNew;
@property int rowNumberWorkout;

@property (weak, nonatomic) IBOutlet UITextField *repsText;
@property (weak, nonatomic) IBOutlet UITextField *setsText;
//@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end
