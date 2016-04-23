

//
//  PLStatisticsViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-26.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PLStatisticsViewControllerDelegate <NSObject>
@required
-(void)dataFromController:(bool)newData;
@end

@interface PLStatisticsViewController: UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSString *exercise;
@property (nonatomic, retain) NSString *benchWeight;
@property (nonatomic, retain) NSString *squatsWeight;
@property (nonatomic, retain) NSString *deadliftWeight;
@property (nonatomic, retain) NSString *benchReps;
@property (nonatomic, retain) NSString *squatsReps;
@property (nonatomic, retain) NSString *deadliftReps;
@property (nonatomic) bool newData;
@property (nonatomic, weak) id<PLStatisticsViewControllerDelegate> delegate;
@property (nonatomic) NSString* benchScore;
@property (nonatomic) NSString* deadliftScore;
@property (nonatomic) NSString* squatScore;
@property (nonatomic) int*rowNumber;

@end

