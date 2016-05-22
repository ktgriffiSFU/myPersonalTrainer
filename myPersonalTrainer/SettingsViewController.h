//
//  SettingsViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-20.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic, strong) IBOutlet UITableView *tableView;

@end