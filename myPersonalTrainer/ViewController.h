//
//  ViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2016-01-19.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <iAd/iAd.h>



@interface ViewController : UIViewController <ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;

@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;
@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView2;

//@property (weak, nonatomic) IBOutlet UILabel *exerciseImageName;
@property (weak, nonatomic) IBOutlet UILabel *exerciseDetails;
@property int rowNumber;
@end