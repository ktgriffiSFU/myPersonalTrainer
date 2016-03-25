

//
//  PLStatisticsViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-26.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLStatisticsViewController: UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) IBOutlet UITableView *tableView;

@end

