
//
//  DetailWorkoutViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-24.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DetailWorkoutViewController.h"
#import "SimpleTableCell.h"

@interface DetailWorkoutViewController ()

@end

@implementation DetailWorkoutViewController
{
    NSArray *exerciseName;
    NSArray *thumbnails;
    NSArray *targetedMuscle;
    NSArray *workoutNameP;
    NSDictionary *workoutArray;
    NSArray *exercisesforWorkout;
    int rowNumber;
}
@synthesize tableView; // Add this line of code
@synthesize rowNumber;
@synthesize workoutName;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"Workouts" ofType:@"plist"];
    // Load the file content and read the data into arrays
    NSDictionary *dict1 = [[NSDictionary alloc] initWithContentsOfFile:path1];
    NSDictionary *dict2 = [[NSDictionary alloc] initWithContentsOfFile:path2];
    workoutNameP = [dict2 objectForKey:@"WorkoutName"];
    self.workoutName.text =[workoutNameP objectAtIndex:rowNumber];
    // Initialize table data
    // Find out the path of recipes.plist
    exerciseName = [dict1 objectForKey:@"ExerciseName"];
    thumbnails = [dict1 objectForKey:@"Thumbnail"];
    targetedMuscle = [dict1 objectForKey:@"TargetedMuscle"];
    workoutArray= [dict2 objectForKey:@"WorkoutArray"];
    exercisesforWorkout =[workoutArray objectForKey:workoutNameP[rowNumber]];
    
    NSLog(@"%@",workoutNameP[rowNumber]);
    NSLog(@"%@",[workoutArray objectForKey:workoutNameP[rowNumber]]);
    for (int i =0 ; i<workoutArray.count; i++) {
       
        printf(":\n");
    }
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
    return [exerciseName count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
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
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.nameLabel.text = [exercisesforWorkout objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.muscleLabel.text = [targetedMuscle objectAtIndex:indexPath.row];
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
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    rowNumber = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showExercisePhoto" sender:self];
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

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([segue.identifier isEqualToString:@"showExercisePhoto"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        ExerciseViewController *destViewController = segue.destinationViewController;
//        destViewController.exerciseImageName = [tableData objectAtIndex:indexPath.row];
//        destViewController.exerciseImageView = [thumbnails objectAtIndex:indexPath.row];
//        destViewController.rowNumber = rowNumber;
//    }
//}

@end