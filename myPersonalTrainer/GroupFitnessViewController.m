//
//  GroupFitnessViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-06-06.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import "GroupFitnessViewController.h"
#import <Foundation/Foundation.h>
@interface GroupFitnessViewController ()

@end

@implementation GroupFitnessViewController{
    
    UIScrollView *myScrollView;
    UIWebView *_webView;
}
@synthesize scrollView;
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title= @"Group Fitness";

    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;

    NSString *urlString = @"https://www.sfu.ca/students/recreation.html";
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screenwidth, screenheight)];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:urlRequest];
    webView.scalesPageToFit=YES;
    [self.view addSubview:webView];


}
@end