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

@implementation ConsistencyViewController{
    int *totalEntries;

}

@synthesize tableView; // Add this line of code
- (void)viewDidLoad{
    [super viewDidLoad];
    NSDictionary *dict = [self getFromDatabase];
    NSMutableDictionary *highscores = [self getOrderedNamesAndCount:dict];
    int mytotalEntries = [self getTotalEntries:highscores];
    totalEntries = &mytotalEntries;
    NSLog(@"%d",mytotalEntries);

}
-(int)getTotalEntries: (NSMutableDictionary *)myDict{
    NSArray *allkeys=[myDict allKeys];
    return allkeys.count;
}
-(NSMutableDictionary*)getOrderedNamesAndCount:(NSDictionary *) bigDict{
        const NSString *kName = @"Name";
        const NSString *kCount = @"Count";
        NSMutableDictionary *highScores = [NSMutableDictionary new]; // a single dictionary rather than your two arrays
        for (NSDictionary *dict in bigDict)                  // same loop as your code
        {
            NSString *nameString = dict[kName];               // same as your code, but using modern syntax
            NSInteger countInt = [dict[kCount] integerValue]; // condense two lines of your code into one
            NSNumber *currentScore = highScores[nameString];  // get current high score for user, if any
            if (currentScore == nil                           // not seen user before, no high score
                || currentScore.integerValue < countInt)      // seen user, countInt is greater
            {
                highScores[nameString] = @(countInt);          // add or update score for user
            }
        }
        NSLog(@"Output: %@", highScores);
    
    return highScores;
    

    
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
    return *(totalEntries);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
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
    cell.accessoryType  = UITableViewCellAccessoryNone;

    

// cell.patronName.text =[namesArray objectAtIndex:indexPath.row];
  //  cell.countAtGym.text =[countArray objectAtIndex:indexPath.row];
    cell.placeLabel.text =[@(indexPath.row+1) stringValue];
    // cell.QuestionLabel.text = [questions objectAtIndex:indexPath.row];
    // cell.detailLabel.text=[detailOptions objectAtIndex:indexPath.row];
    //     cell.thumbnail.image = [UIImage imageNamed:[thumbnail objectAtIndex:indexPath.row]];
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
-(void)sortHighScores:(NSDictionary *) dict{
    NSArray *countArray = [[dict allKeys] sortedArrayUsingSelector: @selector(compare:)];
    NSMutableArray *nameArray = [NSMutableArray array];
    for (NSString *key in countArray){
        [nameArray addObject: [dict objectForKey: key]];
    }

    NSLog(@"Output: %@  %@", nameArray, countArray);
}
@end