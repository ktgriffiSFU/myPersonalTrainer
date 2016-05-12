//
//  WinnerTableCell.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-27.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WinnerTableCell: UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *memberNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *goalLabel;

@end
