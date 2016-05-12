//
//  SetSummaryViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-02.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SetSummaryViewControllerDelegate <NSObject>

@required
- (void)dataFromDController:(bool)newData;

@end
@interface SetSummaryViewController: UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<SetSummaryViewControllerDelegate> delegate;
@property (nonatomic) NSString* repsNew;
@property (nonatomic) NSString* weightNew;
@property (nonatomic) NSString *exercise;
@property (nonatomic) bool newData;

@end