
//
//  WorkoutTableCell.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-16.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface WorkoutTableCell: UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *workoutName;
@property (nonatomic, weak) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *muscleTargeted;
@property (weak, nonatomic) IBOutlet UILabel *equipmentRequired;
@property (weak, nonatomic) IBOutlet UILabel *difficultyLevel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;

@end
