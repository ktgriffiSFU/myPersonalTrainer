//
//  MiscViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-05.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MiscViewController.h"
#import "AnswerCell.h"
@interface MiscViewController()

@end

@implementation MiscViewController
{
    
    NSArray *miscChoices;
}
@synthesize tableView; // Add this line of code


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    miscChoices= [[NSArray alloc] initWithObjects:@"Check In",@"Suggestions",@"Ask A Trainer",@"Find A Trainer", nil];
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
    return [miscChoices count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float statusBar=[UIApplication sharedApplication].statusBarFrame.size.height;
    float navBar=self.navigationController.navigationBar.frame.size.height;
    float screenheight = [UIScreen mainScreen].bounds.size.height;
    float screenSpace= screenheight - (statusBar +navBar);

    return screenSpace/([miscChoices count]+1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"AnswerCell";
    
    AnswerCell *cell = (AnswerCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AnswerCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.QuestionLabel.text=[miscChoices objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row ==0) {
        [self performSegueWithIdentifier:@"checkIn" sender:self];
    }else if(indexPath.row==1){
        [self performSegueWithIdentifier:@"suggestions" sender:self];
    }else if(indexPath.row==2){
        [self performSegueWithIdentifier:@"askATrainer" sender:self];
    }else if(indexPath.row==3){
        [self performSegueWithIdentifier:@"findATrainer" sender:self];
    }
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"checkIn"])
    {
        NSLog(@"check in");
    }else if ([segue.identifier isEqualToString:@"suggestions"])
    {
        NSLog(@"suggestions");
    }else if([segue.identifier isEqualToString:@"askATrainer"])
    {
        NSLog(@"AskATrainer");
    }else if ([segue.identifier isEqualToString:@"findATrainer"])
    {
        NSLog(@"FindATrainer");
    }
}
@end