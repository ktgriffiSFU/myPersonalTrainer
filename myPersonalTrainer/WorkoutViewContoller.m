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
#import "Workout.h"
#import "DetailWorkoutViewController.h"

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
    thumbnail = [dict objectForKey:@"ThumbnailWorkout"];

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
    
    WorkoutTableCell *cell = (WorkoutTableCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WorkoutTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
       // cell = [[WorkoutTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;

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
    rowNumber = indexPath.row;
    NSLog(@"rownumber is %d", rowNumber);
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showWorkout" sender:self];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showWorkout"]) {
        DetailWorkoutViewController *destViewController = segue.destinationViewController;
//        destViewController.exerciseImageName = [workoutName objectAtIndex:indexPath.row];
//        destViewController.exerciseImageView = [thumbnail objectAtIndex:indexPath.row];
 //       destViewController.workoutName =[workoutName objectAtIndex:indexPath.row];
        destViewController.rowNumber = rowNumber;
    }
}
@end