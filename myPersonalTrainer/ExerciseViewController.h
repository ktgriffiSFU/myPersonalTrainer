
//
//  ExerciseViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-28.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *exerciseImageView;
@property (weak, nonatomic) NSString *exerciseImageName;
- (IBAction)close:(id)sender;

@end
