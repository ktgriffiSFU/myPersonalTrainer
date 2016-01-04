
//
//  StatisticsViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-30.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatisticsViewController.h"

@interface StatisticsViewController()

@end

@implementation StatisticsViewController
@synthesize armsScore;
@synthesize shoulderScore;
@synthesize chestScore;
@synthesize backScore;
@synthesize coreScore;
@synthesize legsScore;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"2nd Controller";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createViews];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  
    NSLog(@"Arms : %@",armsScore);
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)createViews
{
    CGRect top, bottom;
    CGRectDivide(self.view.bounds, &top, &bottom, self.view.bounds.size.height / 2, CGRectMinYEdge);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectInset(top, 5, 5)];
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|
    UIViewAutoresizingFlexibleBottomMargin;
    label.textAlignment = NSTextAlignmentCenter;


    label.text = [NSString stringWithFormat:@"Your data: %@", _arms];
    [self.view addSubview:label];
    if (_newData) {
        [[NSUserDefaults standardUserDefaults] setObject:_arms forKey:@"ARMS"];

    }
    armsScore = [[NSUserDefaults standardUserDefaults] stringForKey:@"ARMS"];
    
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.frame = CGRectMake(0, 0, 300, 100);
//    button.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|
//    UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|
//    UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
//    [button setTitle:@"Send Data Back" forState:UIControlStateNormal];
//    button.center = CGPointMake(CGRectGetMidX(bottom), CGRectGetMidY(bottom));
//    [self.view addSubview:button];
    
}
//- (void)passDataBack
//{
//    if ([_delegate respondsToSelector:@selector(dataFromController:)])
//    {
//        [_delegate dataFromController:@"This data is from the second view controller."]:;
//    }
////    
//    [self.navigationController popViewControllerAnimated:YES];
//}
@end