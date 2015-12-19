//
//  DetailWorkoutViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-19.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailWorkoutViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *workoutName;
@property int rowNumber;
@end