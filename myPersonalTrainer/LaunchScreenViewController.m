//
//  LaunchScreenViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-09.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LaunchScreenViewController.h"

@interface LaunchScreenViewController ()

@end

@implementation LaunchScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createViews];
}
-(void)createViews{
    NSInteger *randomInt;
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat width = screenwidth/2;
    CGFloat buttonHeight=screenheight*.105;
    UIImageView *image1 =[[UIImageView alloc] initWithFrame:CGRectMake(0,screenheight/8.3,width,width)];
    UIImageView *image2 =[[UIImageView alloc] initWithFrame:CGRectMake(width,screenheight/8.3, width,width)];
   // image1.image=[UIImage imageNamed:[myImages objectAtIndex:randomInt]];
    [self.view addSubview:image1];
}
-(NSArray *)updateArraysFromPlist{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RandomQuote" ofType:@"plist"];
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *launchArray = [dict objectForKey:@"LaunchScreens"];
    return launchArray;

}
@end