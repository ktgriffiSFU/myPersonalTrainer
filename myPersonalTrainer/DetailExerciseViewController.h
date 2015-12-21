//
//  DetailExerciseViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-21.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailExerciseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;
@property (weak, nonatomic) IBOutlet UILabel *exerciseImageName;
@property (weak, nonatomic) IBOutlet UILabel *exerciseDetails;
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *workoutName;

@property int rowNumberNew;
@property int rowNumberWorkout;

@end
