
//
//  StatTable.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-22.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatTable.h"
#import "StatTableCell.h"
@interface StatTable ()

@end

@implementation StatTable
{
    NSArray *statOptions;

}
@synthesize tableView; // Add this line of code
- (void)viewDidLoad{
    [super viewDidLoad];
    statOptions=[[NSArray alloc] initWithObjects:
                 @"Weekly Progress",@"Rep-Set Bar Chart",@"Consistency Challenge",@"Ask A Trainer Answers", nil];
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
    return 40;
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
    //     cell.thumbnail.image = [UIImage imageNamed:[thumbnail objectAtIndex:indexPath.row]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    //[self performSegueWithIdentifier:@"showWorkout" sender:self];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}


@end

