//
//  FriendsViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2016-01-10.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendsViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
@interface FriendsViewController ()
@end
@implementation FriendsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL
                          URLWithString:@"https://www.facebook.com/My-Personal-Trainer-1040300002698629/?skip_nax_wizard=true"];
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    shareButton.center = self.view.center;
    [self.view addSubview:shareButton];
}


@end