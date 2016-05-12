//
//  FindAPartner.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-09.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FindAPartner.h"
#import "WinnerTableCell.h"
#import "PartnerProfileViewController.h"

@interface FindAPartner()

@end

@implementation FindAPartner
{
    int rowNumber;
}
@synthesize tableView; // Add this line of code


- (void)viewDidLoad
{
    [super viewDidLoad];
   
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
    static NSString *simpleTableIdentifier = @"WinnerTableCell";
    
    WinnerTableCell *cell = (WinnerTableCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WinnerTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSMutableDictionary *dict = [self getFromDatabase];
    NSArray *memberNames= [self makeArrayDB:dict :@"MemberName"];
    NSArray *timeChoices= [self makeArrayDB:dict :@"TimeChoice"];
    NSArray *goals = [self makeArrayDB:dict :@"Goals"];
    
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    cell.memberNameLabel.text=[memberNames objectAtIndex:indexPath.row];
    cell.timeLabel.text=[timeChoices objectAtIndex:indexPath.row];
    cell.goalLabel.text=[goals objectAtIndex:indexPath.row];
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
    
    if ([segue.identifier isEqualToString:@"showPartnerProfile"]) {
        NSMutableDictionary *dict = [self getFromDatabase];
        NSArray *memberNames= [self makeArrayDB:dict :@"MemberName"];
        NSArray *timeChoices= [self makeArrayDB:dict :@"TimeChoice"];
        NSArray *goals = [self makeArrayDB:dict :@"Goals"];
        NSArray *summary=[self makeArrayDB:dict :@"Summary"];
        
        
        
        PartnerProfileViewController *destViewController= segue.destinationViewController;
        destViewController.partnerTimes=[timeChoices objectAtIndex:rowNumber];
        destViewController.partnerSummary=[summary objectAtIndex:rowNumber];
        destViewController.partnerName=[memberNames objectAtIndex:rowNumber];
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
-(NSArray *)makeArrayDB:(NSMutableDictionary*)dict :(NSString *)characteristic{
    NSMutableArray *itemArray = [[NSMutableArray alloc] init];

    for (NSDictionary *dict in dict) {
        NSString *itemString =[dict objectForKey:characteristic];
        [itemArray addObject:itemString];
    }
    NSArray *itemReversed=[[itemArray reverseObjectEnumerator]allObjects];
    return itemReversed;
}
-(NSMutableDictionary*) getFromDatabase{
    NSURL * url=[NSURL URLWithString:@"http://artistfolio.net/findAParter.php"];
    NSData * data=[NSData dataWithContentsOfURL:url];
    NSError * error;
    NSMutableDictionary *dictQA = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
    return dictQA;
    
}
@end