

//
//  SetSummaryViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-02.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SetSummaryViewController.h"
#import "SetSummaryCell.h"
#import "DetailExerciseViewController.h"
@interface SetSummaryViewController()

@end

@implementation SetSummaryViewController
{
    
    int count;
    NSArray *exercises;
}
@synthesize tableView; // Add this line of code
@synthesize repsNew,weightNew,exercise;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(NSArray *)getSets :(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *tempArray = [userDefaults objectForKey:key];
    NSMutableArray* itemArray  = [NSMutableArray arrayWithArray:tempArray];

    NSArray *array=[itemArray copy];
    return array;
}
-(void)updateSets :(NSString *)key :(NSString *)value{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSMutableArray* itemArray  = [NSMutableArray arrayWithArray:tempArray];
    if (itemArray==nil) {
        itemArray=[[NSMutableArray alloc] init];
    }
    if (_newData) {
        [itemArray addObject:value];
        
        [userDefaults setObject:itemArray forKey:key];
    }
}
-(void)viewDidAppear:(BOOL)animated{
    //    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//[[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [super viewDidAppear:animated];
    [self updateSets:@"exercisesArray" :exercise];
    [self updateSets:@"repsArray" :repsNew];
    [self updateSets:@"weightsArray" :weightNew];
   
    

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
    exercises = [self getSets:@"exercisesArray"];

    return [exercises count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SetSummaryCell";
    
    SetSummaryCell *cell = (SetSummaryCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SetSummaryCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    exercises = [self getSets:@"exercisesArray"];
    NSArray *reps = [self getSets:@"repsArray"];
    NSArray *weights = [self getSets:@"weightsArray"];
    NSArray *reversedReps= [[reps reverseObjectEnumerator]allObjects];
    NSArray *reversedWeight=[[weights reverseObjectEnumerator]allObjects];
    NSArray *reversedExercises=[[exercises reverseObjectEnumerator]allObjects];
    cell.exerciseLabel.text=[reversedExercises objectAtIndex:indexPath.row];
    cell.repsLabel.text=[reversedReps objectAtIndex:indexPath.row];
    cell.weightLabel.text=[reversedWeight objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    return indexPath;
}
@end