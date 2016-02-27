//
//  StatTableCell.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-27.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface StatTableCell: UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *statName;

@property (weak, nonatomic) IBOutlet UIImageView *statIcon;

@end
