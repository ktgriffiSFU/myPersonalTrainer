//
//  ExerciseTableViewCell.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-24.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
