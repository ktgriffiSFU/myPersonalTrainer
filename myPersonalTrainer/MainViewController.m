//
//  MainViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-23.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import "MainViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)workoutButton:(UIButton *)sender {
}
- (IBAction)exerciseButton:(UIButton *)sender {
    [self performSegueWithIdentifier:@"ShowTable" sender:self];
    
}
- (IBAction)friendsButton:(UIButton *)sender {
}
- (IBAction)statisticsButton:(UIButton *)sender {
}


@end
