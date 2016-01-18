//
//  ViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-23.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface MainViewController : UIViewController <ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;

@end

