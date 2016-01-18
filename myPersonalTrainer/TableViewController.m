
//
//  TableViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-24.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "ExerciseViewController.h"
#import "SimpleTableCell.h"

@interface TableViewController ()

@end

@implementation TableViewController
{
    NSArray *tableData;
    NSArray *thumbnails;
    NSArray *targetedMuscle;
    int rowNumber;
}
@synthesize tableView; // Add this line of code

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    tableData = [dict objectForKey:@"ExerciseName"];
    thumbnails = [dict objectForKey:@"Thumbnail"];
    targetedMuscle = [dict objectForKey:@"TargetedMuscle"];
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
    return [tableData count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
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
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    rowNumber = indexPath.row;
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showExercisePhoto"]) {
        ExerciseViewController *destViewController = segue.destinationViewController;
        destViewController.rowNumber = rowNumber;
    }
}

@end