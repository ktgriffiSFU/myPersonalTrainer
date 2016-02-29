//
//  CheckInViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-22.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface CheckInViewController : UIViewController <NSURLSessionDelegate>

- (IBAction)submitButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *signInCode;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;

@end
