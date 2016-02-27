
//
//  StatTable.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-22.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatTable.h"
#import "StatisticsViewController.h"
#import "StatTableCell.h"
@interface StatTable ()

@end

@implementation StatTable
{
    NSArray *statOptions;
    NSArray *detailOptions;
}
@synthesize tableView; // Add this line of code
- (void)viewDidLoad{
    [super viewDidLoad];
    statOptions=[[NSArray alloc] initWithObjects:
                 @"Weekly Progress",@"Reps Bar Chart",@"Consistency Challenge",@"Ask A Trainer Answers", nil];
    detailOptions=[[NSArray alloc] initWithObjects:
                   @"Check your weekly activity",
                   @"See how many reps you have done over the month",
                   @"Find out who is winning the consistency challenge",
                   @"See what we have to say about fitness", nil];
    //ArrayofIcons
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
    return [statOptions count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"StatTableCell";
    
    StatTableCell *cell = (StatTableCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"StatTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.statName.text = [statOptions objectAtIndex:indexPath.row];
    cell.detailLabel.text=[detailOptions objectAtIndex:indexPath.row];
    //     cell.thumbnail.image = [UIImage imageNamed:[thumbnail objectAtIndex:indexPath.row]];

    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *identifierArray=[[NSArray alloc] initWithObjects:
                              @"showView1",@"showView2",@"showView3",@"showView4", nil];
    NSString *identifer =[identifierArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:identifer sender:self];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showView1"]) {
    //    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //    StatisticsViewController *destViewController = segue.destinationViewController;
    }else if ([segue.identifier isEqualToString:@"showView2"]) {
     //   NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      //  StatisticsViewController *destViewController = segue.destinationViewController;
    }else if([segue.identifier isEqualToString:@"showView3"]) {
     //   NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       // StatisticsViewController *destViewController = segue.destinationViewController;
    }else if([segue.identifier isEqualToString:@"showView4"]) {
    //    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      //  StatisticsViewController *destViewController = segue.destinationViewController;
    }
}

@end

