//
//  SetSummaryCell.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-02.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import "SetSummaryCell.h"

@implementation SetSummaryCell
@synthesize exerciseLabel = _exerciseLabel;
@synthesize weightLabel = _weightLabel;
@synthesize repsLabel = _repsLabel;

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
