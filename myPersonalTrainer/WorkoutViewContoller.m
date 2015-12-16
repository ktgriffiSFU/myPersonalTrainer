//
//  WorkoutViewContoller.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-16.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WorkoutViewContoller.h"
#import "WorkoutTableCell.h"

@interface WorkoutViewContoller ()

@end

@implementation WorkoutViewContoller
{
    NSArray *workoutName;
    NSArray *time;
    NSArray *musclesTargeted;
    NSArray *difficultyLevel;
    NSArray *equipmentRequired;
    NSArray *thumbnail;
    int rowNumber;
}
@synthesize tableView; // Add this line of code

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Workouts" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    workoutName = [dict objectForKey:@"WorkoutName"];
    time = [dict objectForKey:@"Time"];
    musclesTargeted = [dict objectForKey:@"MusclesTargeted"];
    difficultyLevel = [dict objectForKey:@"DifficultyLevel"];
    equipmentRequired = [dict objectForKey:@"EquipmentRequired"];
    thumbnail = [dict objectForKey:@"Thumbnail"];

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
    return [workoutName count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"WorkoutTableCell";
    
    WorkoutTableCell *cell = (WorkoutTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WorkoutTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.workoutName.text = [workoutName objectAtIndex:indexPath.row];
    cell.thumbnail.image = [UIImage imageNamed:[thumbnail objectAtIndex:indexPath.row]];
    cell.muscleTargeted.text = [musclesTargeted objectAtIndex:indexPath.row];
    cell.time.text =[time objectAtIndex:indexPath.row];
    cell.equipmentRequired.text =[equipmentRequired objectAtIndex:indexPath.row];
    cell.difficultyLevel.text = [difficultyLevel objectAtIndex:indexPath.row];
    
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
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    if ([segue.identifier isEqualToString:@"showExercisePhoto"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        ExerciseViewController *destViewController = segue.destinationViewController;
//        destViewController.exerciseImageName = [tableData objectAtIndex:indexPath.row];
//        destViewController.exerciseImageView = [thumbnails objectAtIndex:indexPath.row];
//        destViewController.rowNumber = rowNumber;
//        NSLog(@"Row is: %d",indexPath.row);
//    }
//}

@end