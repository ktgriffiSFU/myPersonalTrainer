//
//  WorkoutTableCell.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-16.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import "WorkoutTableCell.h"

@implementation WorkoutTableCell
@synthesize workoutName = _workoutName;
@synthesize time= _time;
@synthesize muscleTargeted=_muscleTargeted;
@synthesize equipmentRequired=_equipmentRequired;
@synthesize difficultyLevel=_difficultyLevel;
@synthesize thumbnail = _thumbnail;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
