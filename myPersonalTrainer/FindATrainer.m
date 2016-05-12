
//
//  FindATrainer.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-05.
//  Copyright © 2016 Kyle Griffith. All rights reserved.


#import <Foundation/Foundation.h>
#import "FindATrainer.h"
#import "SimpleTableCell.h"
#import "TrainerProfileViewController.h"

@interface FindATrainer()

@end

@implementation FindATrainer
{
    int rowNumber;
}
@synthesize tableView; // Add this line of code


- (void)viewDidLoad
{
    [super viewDidLoad];
  //  NSMutableDictionary *dictQA = [self getFromDatabase];
 //   [self initArrays:dictQA];

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
    NSArray *names=[self createArraysPlist:@"Names"];
    return [names count];
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
    NSArray *names=[self createArraysPlist:@"Names"];
    NSArray *icons=[self createArraysPlist:@"Icons"];
    NSArray *focus=[self createArraysPlist:@"Focus"];


    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.nameLabel.text=[names objectAtIndex:indexPath.row];
    cell.muscleLabel.text=[focus objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image=[UIImage imageNamed:[icons objectAtIndex:indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    rowNumber = indexPath.row;

    [self performSegueWithIdentifier:@"showTrainerProfile" sender:self];

}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showTrainerProfile"]) {
        NSArray *summary=[self createArraysPlist:@"Fact Sheet"];
        NSArray *names=[self createArraysPlist:@"Names"];
        NSArray *icons=[self createArraysPlist:@"Icons"];



        TrainerProfileViewController *destViewController= segue.destinationViewController;
        destViewController.trainerSummary=[summary objectAtIndex:rowNumber];
        destViewController.trainerPic=[icons objectAtIndex:rowNumber];
        destViewController.trainerName=[names objectAtIndex:rowNumber];
        destViewController.rowNumber=rowNumber;
        NSLog(@"%d",rowNumber);
        
    }
}


- (NSArray *)createArraysPlist: (NSString *) info{
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"trainerProfile" ofType:@"plist"];
    NSDictionary *dict1 = [[NSDictionary alloc] initWithContentsOfFile:path1];
   NSArray *array = [dict1 objectForKey:info];
    return array;
}


@end