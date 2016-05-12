//
//  SetSummaryCell.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-02.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetSummaryCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *exerciseLabel;
@property (nonatomic, weak) IBOutlet UILabel *weightLabel;
@property (nonatomic, weak) IBOutlet UILabel *repsLabel;

@end