//
//  ViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2016-01-19.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//
#import <UIKit/UIKit.h>


@protocol VideoViewControllerDelegate <NSObject>

@optional

- (NSString*)videoIdForResourceAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface ViewController : UIViewController


//@property (weak, nonatomic) IBOutlet UILabel *exerciseImageName;
@property (weak, nonatomic) IBOutlet UILabel *exerciseDetails;
@property int rowNumber;
@property (nonatomic, assign) BOOL showDoneButton;
@property (nonatomic, weak) id<VideoViewControllerDelegate> videoDelegate;
- (instancetype)initWithResource:(NSArray*)resource;
@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;
@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView2;

@end