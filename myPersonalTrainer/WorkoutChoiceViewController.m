//
//  WorkoutChoiceViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-03-12.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkoutChoiceViewController.h"
#import "AnswerCell.h"
@interface WorkoutChoiceViewController()

@end

@implementation WorkoutChoiceViewController
{

    NSArray *workoutChoices;
}
@synthesize tableView; // Add this line of code


- (void)viewDidLoad
{
    [super viewDidLoad];

    workoutChoices= [[NSArray alloc] initWithObjects:@"General Fitness",@"Power Lifting", nil];
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
    return [workoutChoices count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.QuestionLabel.text=[workoutChoices objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row ==0) {
        [self performSegueWithIdentifier:@"generalFit" sender:self];
    }else{
   [self performSegueWithIdentifier:@"powerLift" sender:self];
    }
}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"generalFit"]) {
        NSLog(@"General fitness");
    }else if ([segue.identifier isEqualToString:@"powerLift"])
    {
        NSLog(@"PowerLift");
    }
}
@end