//
//  AskForBuddyViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-23.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AskForBuddyViewController.h"
#import "AnswerCell.h"

@interface AskForBuddyViewController ()

@end

@implementation AskForBuddyViewController
{
    NSArray *userEntries;
    NSArray *controlKeys;
    UITextField *userEntryField;
    UITextView *aboutEntryView;
    UILabel *controlLabel;
    
    //info button
    
    int rowNumber;
    int rowSelected;
}
@synthesize tableView; // Add this line of code


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    // Find out the path of recipes.plist
    UIImage *infoImage=[UIImage imageNamed:@"info.png"];
    
    userEntries = [[NSArray alloc]initWithObjects:@"Time of Day",@"Days of Week",@"Gender",@"About", nil];
    controlKeys = [[NSArray alloc]initWithObjects:@"time",@"days",@"gender",@"about", nil];
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc]
                                   initWithImage:infoImage
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(infoView)];
    
    self.navigationItem.rightBarButtonItem = infoButton;
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [userEntries count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row +1==[userEntries count]) {
        return 200;
    }
    else{
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"AnswerCell";
    
    AnswerCell *cell = (AnswerCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AnswerCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        // cell = [[WorkoutTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    rowNumber = indexPath.row;
    if (indexPath.row+1<[userEntries count]) {
        [self createViewsInCell:@"key":rowNumber:44.0];
    }else{
        [self createViewsInAboutCell:@"key":rowNumber:44.0];

    }
    
    return cell;
}
-(void)createViewsInAboutCell :(NSString *)key :(int)index :(CGFloat)otherScreenheight{
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight= 200;
    CGFloat position=rowNumber*otherScreenheight;
    
    CGRect frame = CGRectMake(screenwidth*.25, position+.1*screenheight, screenwidth*.70, screenheight*.8);
    aboutEntryView = [[UITextView alloc] initWithFrame:frame];
    aboutEntryView.tag=index;
    aboutEntryView.textColor = [UIColor blackColor];
    aboutEntryView.font = [UIFont systemFontOfSize:17.0];
    aboutEntryView.backgroundColor = [UIColor clearColor];
    aboutEntryView.autocorrectionType = UITextAutocorrectionTypeYes;
    aboutEntryView.keyboardType = UIKeyboardTypeDefault;
    aboutEntryView.delegate = self;
    aboutEntryView.textAlignment = NSTextAlignmentLeft;
    [aboutEntryView setKeyboardType:UIKeyboardTypeNumberPad];
    aboutEntryView.layer.borderWidth = 5.0f;
    aboutEntryView.layer.borderColor = [[UIColor grayColor] CGColor];
    [self.view addSubview:aboutEntryView];
    
    controlLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,position,screenwidth*0.5,screenheight)];
    controlLabel.text=[userEntries objectAtIndex:index];
    controlLabel.backgroundColor =[UIColor clearColor];
    [controlLabel setFont:[UIFont fontWithName:@"Avenir" size:15]];
    controlLabel.textAlignment = NSTextAlignmentLeft;
    
    
    //ADD MORE: when functionality works
    [self.view addSubview:controlLabel];
    
}
-(void)createViewsInCell :(NSString *)key :(int)index :(CGFloat)screenheight{
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat position= rowNumber*screenheight;
    
    //[UIImage imageNamed:[thumbnailforWorkout objectAtIndex:rowNumberNew]];
    
    
    CGRect frame = CGRectMake(screenwidth*.75, position+.1*screenheight, screenwidth*.20, screenheight*.8);
    userEntryField = [[UITextField alloc] initWithFrame:frame];
    userEntryField.tag=index;
  //  userEntryField.borderStyle = UITextBorderStyleRoundedRect;
    userEntryField.textColor = [UIColor blackColor];
    userEntryField.font = [UIFont systemFontOfSize:17.0];
    userEntryField.layer.borderWidth = 5.0f;
    userEntryField.placeholder = [[NSUserDefaults standardUserDefaults] objectForKey:[controlKeys objectAtIndex:rowNumber]];
    userEntryField.backgroundColor = [UIColor clearColor];
    userEntryField.autocorrectionType = UITextAutocorrectionTypeYes;
    userEntryField.keyboardType = UIKeyboardTypeDefault;
    userEntryField.clearButtonMode = UITextFieldViewModeWhileEditing;
    userEntryField.delegate = self;
    userEntryField.textAlignment = NSTextAlignmentLeft;
    [userEntryField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:userEntryField];
    
    controlLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/10,position,screenwidth*0.5,screenheight)];
    controlLabel.text=[userEntries objectAtIndex:index];
    controlLabel.backgroundColor =[UIColor clearColor];
    [controlLabel setFont:[UIFont fontWithName:@"Avenir" size:15]];
    controlLabel.textAlignment = NSTextAlignmentLeft;
    
    
    //ADD MORE: when functionality works
    [self.view addSubview:controlLabel];
    
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
}
-(void)infoView{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Select a Workout"
                          message:@"This is where you can choose a workout to do"
                          delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSUInteger index= textField.tag;
    [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:[controlKeys objectAtIndex:index]];
    textField.layer.borderColor=[[UIColor grayColor] CGColor];

    
}
#pragma keyboard methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)dismissKeyboard {
    [userEntryField resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.layer.borderColor=[[UIColor redColor] CGColor];
}

@end