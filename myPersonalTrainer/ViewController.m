//
//  ViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2016-01-19.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *exercises;
    NSArray *pictures;
    NSArray *pictures2;
    NSArray *details;
}
@synthesize exerciseImageView;
@synthesize exerciseImageView2;
@synthesize exerciseDetails;
@synthesize rowNumber;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)initView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    exercises = [dict objectForKey:@"ExerciseName"];
    pictures = [dict objectForKey:@"Thumbnail"];
    pictures2 = [dict objectForKey:@"Thumbnail2"];
    details = [dict objectForKey:@"Details"];
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat width = screenwidth/2;
    UIImageView *image1 =[[UIImageView alloc] initWithFrame:CGRectMake(0,67,width,width)];
    UIImageView *image2 =[[UIImageView alloc] initWithFrame:CGRectMake(width,67, width,width)];
    image1.image=[UIImage imageNamed:[pictures objectAtIndex:rowNumber]];
    image2.image=[UIImage imageNamed:[pictures2 objectAtIndex:rowNumber]];
    [self.view addSubview:image1];
    [self.view addSubview:image2];
    
    self.exerciseImageView.image = [UIImage imageNamed:[pictures objectAtIndex:rowNumber]];
    self.exerciseImageView2.image = [UIImage imageNamed:[pictures2 objectAtIndex:rowNumber]];
    self.exerciseDetails.text =[details objectAtIndex:rowNumber];
    self.title = [exercises objectAtIndex:rowNumber];
}

@end

