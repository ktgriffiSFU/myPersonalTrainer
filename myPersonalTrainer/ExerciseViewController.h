
//
//  ExerciseViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-28.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@interface ExerciseViewController : UIViewController <ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;

@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;
@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView2;

//@property (weak, nonatomic) IBOutlet UILabel *exerciseImageName;
@property (weak, nonatomic) IBOutlet UILabel *exerciseDetails;
@property int rowNumber;

@end
