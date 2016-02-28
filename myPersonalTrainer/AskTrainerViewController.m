//
//  AskTrainerViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-27.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AskTrainerViewController.h"
#import "AnswerTrainerViewController.h"
#import "AnswerCell.h"
@interface  AskTrainerViewController()

@end

@implementation AskTrainerViewController
{
    NSArray *answers;
    NSArray *questions;
    NSArray *identitynumbers;
    int rowNumber;
}
@synthesize tableView; // Add this line of code
- (void)viewDidLoad{
    [super viewDidLoad];
    NSMutableDictionary *dictQA = [self getFromDatabase];
    NSMutableArray *questionsArray = [[NSMutableArray alloc] init];
    NSMutableArray *answersArray = [[NSMutableArray alloc] init];
    NSMutableArray *idArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in dictQA) {
        NSString *questionString =[dict objectForKey:@"Question"];
        NSString *answerString =[dict objectForKey:@"Answer"];
        NSString *idString =[dict objectForKey:@"ID"];
        [questionsArray addObject:questionString];
        [answersArray addObject:answerString];
        [idArray addObject:idString];
    }
    
    answers =[[answersArray reverseObjectEnumerator]allObjects];
    questions =[[questionsArray reverseObjectEnumerator]allObjects];
    identitynumbers=[idArray copy];
    
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
    
    AnswerCell *cell = (AnswerCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AnswerCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.QuestionLabel.text = [questions objectAtIndex:indexPath.row];
   // cell.detailLabel.text=[detailOptions objectAtIndex:indexPath.row];
    //     cell.thumbnail.image = [UIImage imageNamed:[thumbnail objectAtIndex:indexPath.row]];
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    rowNumber = indexPath.row;

    [self performSegueWithIdentifier:@"showAnswer" sender:self];


}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
-(NSMutableDictionary*) getFromDatabase{
    NSURL * url=[NSURL URLWithString:@"http://artistfolio.net/trainer.php"];
    NSData * data=[NSData dataWithContentsOfURL:url];
    NSError * error;
    NSMutableDictionary *dictQA = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
    return dictQA;

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showAnswer"]) {

        AnswerTrainerViewController *destViewController = segue.destinationViewController;
        destViewController.answerString=[answers objectAtIndex:rowNumber];
        destViewController.questionString=[questions objectAtIndex:rowNumber];

        NSLog(@"%d",rowNumber);

    }
}


@end