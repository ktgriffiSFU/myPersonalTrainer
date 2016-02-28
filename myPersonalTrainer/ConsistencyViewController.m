//
//  ConsistencyViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-27.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ConsistencyViewController.h"
#import "WinnerTableCell.h"

@interface ConsistencyViewController ()

@end

@implementation ConsistencyViewController
{
    NSArray *names;
    NSArray *counts;
    NSArray *identitynumbers;
    int rowNumber;
}
@synthesize tableView; // Add this line of code
- (void)viewDidLoad{
    [super viewDidLoad];
    NSMutableDictionary *dictQA = [self getFromDatabase];
    [self getOrderedNamesAndCount:dictQA];
    NSLog(@"%@%",names);
}
-(void)getOrderedNamesAndCount:(NSMutableDictionary *) bigDick{
    NSMutableArray *userNameArray = [[NSMutableArray alloc] init];
    NSMutableArray *countArray = [[NSMutableArray alloc] init];
    NSMutableArray *idArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in bigDick) {
        NSString *nameString =[dict objectForKey:@"Name"];
        NSString *countString =[dict objectForKey:@"Count"];
        NSString *idString =[dict objectForKey:@"Entry"];
        [userNameArray addObject:nameString];
        [countArray addObject:countString];
        [idArray addObject:idString];
    }
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionaryWithObjects: countArray forKeys: userNameArray];
    NSDictionary *dictionary=[tempDict copy];
    
    
    NSArray *sortedKeys = [self sortKeysByIntValue:dictionary];
    NSMutableDictionary *sortedDictionary = [[NSMutableDictionary alloc] init];
    
    for (NSString *key in sortedKeys){
        [sortedDictionary setObject:dictionary[key] forKey:key];
    }
    names = [sortedDictionary allKeys];
    
    counts = [sortedDictionary allValues];

    
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
    return [identitynumbers count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"AnswerCell";
    
    WinnerTableCell *cell = (WinnerTableCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WinnerTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    // cell.QuestionLabel.text = [questions objectAtIndex:indexPath.row];
    // cell.detailLabel.text=[detailOptions objectAtIndex:indexPath.row];
    //     cell.thumbnail.image = [UIImage imageNamed:[thumbnail objectAtIndex:indexPath.row]];
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    rowNumber = indexPath.row;
    
    
    
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
-(NSMutableDictionary*) getFromDatabase{
    NSURL * url=[NSURL URLWithString:@"http://artistfolio.net/memberAttends.php"];
    NSData * data=[NSData dataWithContentsOfURL:url];
    NSError * error;
    NSMutableDictionary *dictQA = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
    return dictQA;
    
    
}
- (NSArray *)sortKeysByIntValue:(NSDictionary *)dictionary {
    
    NSArray *sortedKeys = [dictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int v1 = [obj1 intValue];
        int v2 = [obj2 intValue];
        if (v1 < v2)
            return NSOrderedAscending;
        else if (v1 > v2)
            return NSOrderedDescending;
        else
            return NSOrderedSame;
    }];
    return sortedKeys;
}
@end