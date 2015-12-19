//
//  WorkoutViewContoller.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-16.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutViewContoller : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;

@end