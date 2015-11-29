
//
//  LoginViewController.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-23.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//


#import <UIKit/UIKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface SCLoginViewController : UIViewController <FBSDKLoginButtonDelegate>

@property (nonatomic, strong) IBOutlet FBSDKLoginButton *loginButton;
@property (nonatomic, strong) IBOutlet UIButton *continueButton;

- (IBAction)showLogin:(UIStoryboardSegue *)segue;

@end