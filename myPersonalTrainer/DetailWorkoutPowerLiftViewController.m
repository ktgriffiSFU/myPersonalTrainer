
//
//  DetailWorkoutPowerLiftViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-03-12.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DetailWorkoutPowerLiftViewController.h"
#import "DetailExerciseViewController.h"
#import "SimpleTableCell.h"

@interface DetailWorkoutPowerLiftViewController ()

@end

@implementation DetailWorkoutPowerLiftViewController
{
    NSArray *powerLiftingExercises,*exerciseThumbnails,*heaviestLift;
}
@synthesize tableView; // Add this line of code
@synthesize rowNumber;
//@synthesize workoutName;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getData];
}
-(void)getData{
    powerLiftingExercises = [[NSArray alloc] initWithObjects:@"Squats",@"Deadlifts",@"Bench Press", nil];
    exerciseThumbnails  =[[NSArray alloc] initWithObjects:@"Squat.png",@"Deadlift.png",@"BenchPress.png", nil];
    //TODO: Get heaviestLift from the recording view controller
    
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
    return [powerLiftingExercises count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
 //   cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.nameLabel.text = [powerLiftingExercises objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[exerciseThumbnails objectAtIndex:indexPath.row]];
 //   cell.muscleLabel.text = [targetedMuscleforWorkout objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    
    
    /*UIAlertView *messageAlert = [[UIAlertView alloc]
     initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];*/
    //    UIAlertView *messageAlert = [[UIAlertView alloc]
    //                                 initWithTitle:@"Row Selected" message:[tableData objectAtIndex:indexPath.row] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    // Display the Hello World Message
    // [messageAlert show];
    
    // Checked the selected row
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    rowNumber = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showExercise" sender:self];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    
    
    //    if (indexPath.row == 0) {
    //        return nil;
    //    }
    //
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showExercise"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      //  DetailExerciseViewController *destViewController = segue.destinationViewController;
        //        destViewController.exerciseImageView = [thumbnailforWorkout objectAtIndex:indexPath.row];
     //   destViewController.rowNumberNew = rowNumber;
     //   destViewController.rowNumberWorkout = rowNumberOld;
    }
}

@end