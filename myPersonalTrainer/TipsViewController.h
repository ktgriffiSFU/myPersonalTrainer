
//
//  TipsViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-24.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//
#import <iAd/iAd.h>

@interface TipsViewController : UIViewController <ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;


@end