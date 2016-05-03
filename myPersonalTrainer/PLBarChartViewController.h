//
//  PLBarChartViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-04-28.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
@interface PLBarChartViewController: UIViewController <CPTBarPlotDataSource, CPTBarPlotDelegate>
@end