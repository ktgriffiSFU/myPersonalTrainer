//
//  DetailWorkoutPowerLiftViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-03-12.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailWorkoutPowerLiftViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) IBOutlet UITableView *tableView;
//@property (weak, nonatomic) IBOutlet UILabel *workoutName;
@property int rowNumber;
@property(strong)  NSIndexPath* lastIndexPath;
@end