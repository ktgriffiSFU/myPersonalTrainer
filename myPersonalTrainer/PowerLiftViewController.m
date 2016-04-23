//
//  PowerLiftViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-03-13.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PowerLiftViewController.h"
#import "PLStatisticsViewController.h"
@interface PowerLiftViewController ()<PLStatisticsViewControllerDelegate>
{
    UITextField *weightField;
    UILabel *countLabel;
    bool newScore;

}
@end

@implementation PowerLiftViewController
@synthesize exercise;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title= exercise;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [weightField setKeyboardType:UIKeyboardTypeNumberPad];
    [weightField setDelegate:self];

    [self createViews];
    
}
- (void)dataFromController:(bool)newData;
{
    newData=newScore;
}
-(void)dismissKeyboard {
    [weightField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void) createViews{
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight=[UIScreen mainScreen].bounds.size.height;
    CGFloat width = screenwidth/2;
    CGFloat yValue=(300.0+width);
    CGFloat y2Value=(100.0+width);

    //Big label
    countLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/6,screenheight/8,screenwidth*0.666,screenheight/3)];
    countLabel.text=@"0";
    countLabel.backgroundColor =[UIColor yellowColor];
    [countLabel setFont:[UIFont fontWithName:@"American Typewriter" size:200]];
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.adjustsFontSizeToFitWidth=YES;
    countLabel.minimumScaleFactor=0.5;

    //ADD MORE: when functionality works
    [self.view addSubview:countLabel];
    
    
    
    //Big button X2

    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [plusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plusButton addTarget:self
                action:@selector(increaseNumberLabel)
      forControlEvents:UIControlEventTouchUpInside];
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    plusButton.frame = CGRectMake(screenwidth*5/6,screenheight/8,screenwidth/6,screenheight/3);
    [plusButton setBackgroundColor:[UIColor greenColor]];
    plusButton.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    [self.view addSubview:plusButton];
    
    UIButton *minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [minusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [minusButton addTarget:self
                    action:@selector(decreaseNumberLabel) forControlEvents:UIControlEventTouchUpInside];
    [minusButton setTitle:@"-" forState:UIControlStateNormal];
    minusButton.frame = CGRectMake(0,screenheight/8,screenwidth/6,screenheight/3);
    [minusButton setBackgroundColor:[UIColor grayColor]];
    minusButton.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    [self.view addSubview:minusButton];
    
    //Weight text field
    CGRect frame = CGRectMake(50.0,  y2Value+25, screenwidth-100, 30);
    weightField = [[UITextField alloc] initWithFrame:frame];
    weightField.borderStyle = UITextBorderStyleRoundedRect;
    weightField.textColor = [UIColor blackColor];
    weightField.font = [UIFont systemFontOfSize:17.0];
    weightField.placeholder = @"WEIGHT";
    weightField.backgroundColor = [UIColor clearColor];
    weightField.autocorrectionType = UITextAutocorrectionTypeYes;
    weightField.keyboardType = UIKeyboardTypeDefault;
    weightField.clearButtonMode = UITextFieldViewModeWhileEditing;
    weightField.delegate = self;
    weightField.textAlignment = NSTextAlignmentCenter;
    [weightField setKeyboardType:UIKeyboardTypeNumberPad];

    [self.view addSubview:weightField];
    
    
    //Submit Button
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton addTarget:self
                action:@selector(passDataForward)
      forControlEvents:UIControlEventTouchUpInside];
    [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
    submitButton.frame = CGRectMake(0, yValue, screenwidth, 60.0);
    [submitButton setBackgroundColor:[UIColor redColor]];
    submitButton.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    [self.view addSubview:submitButton];

}
-(void)passDataForward{
    newScore=YES;
    NSString *weightString = weightField.text;
    NSString *repsString =countLabel.text;
    PLStatisticsViewController *secondViewController= [[PLStatisticsViewController alloc] init];
    secondViewController.newData=newScore;
    secondViewController.exercise=exercise;
    if ([exercise isEqualToString:@"Bench Press"]) {
        secondViewController.benchReps=repsString;
        secondViewController.benchWeight=weightString;
    }else if ([exercise isEqualToString:@"Squats"]){
        secondViewController.squatsReps=repsString;
        secondViewController.squatsWeight=weightString;
    }else{
        secondViewController.deadliftReps=repsString;
        secondViewController.deadliftWeight=weightString;
    }
    
       [self.navigationController pushViewController:secondViewController animated:NO];
}
-(void)increaseNumberLabel{
    NSString *countString = countLabel.text;
    int countInt = [countString integerValue];
    countInt++;
    countString=[@(countInt) stringValue];
    countLabel.text=countString;

}
-(void)decreaseNumberLabel{
    NSString *countString = countLabel.text;
    int countInt = [countString integerValue];
    if (countInt>0) {
        countInt--;
    }
    countString=[@(countInt) stringValue];
    countLabel.text=countString;
}
@end