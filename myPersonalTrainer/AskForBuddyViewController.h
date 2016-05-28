//
//  AskForBuddyViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-23.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskForBuddyViewController : UITableViewController <UITextViewDelegate,UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic, strong) IBOutlet UITableView *tableView;

@end