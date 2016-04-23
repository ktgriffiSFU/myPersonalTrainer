
//
//  PLStatsCell.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-03-24.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface PLStatsCell : UITableViewCell
//<CPTPlotDataSource>
//@property (nonatomic, strong) CPTGraphHostingView *hostView;
@property (weak, nonatomic) IBOutlet UILabel *exerciseLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightArrayLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsArrayLabel;

@end