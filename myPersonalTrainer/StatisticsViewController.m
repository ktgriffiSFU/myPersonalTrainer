
//
//  StatisticsViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-30.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatisticsViewController.h"
#import "DetailExerciseViewController.h"
#import <EventKit/EventKit.h>

@interface StatisticsViewController()

@end

@implementation StatisticsViewController
@synthesize armsScore;
@synthesize shoulderScore;
@synthesize chestScore;
@synthesize backScore;
@synthesize coreScore;
@synthesize legsScore;

- (void)viewDidLoad
{
    [super viewDidLoad];


}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    DetailExerciseViewController *viewControllerB = [[DetailExerciseViewController alloc] initWithNibName:@"DetailExerciseViewController" bundle:nil];
    viewControllerB.delegate = self;
    [self.navigationController pushViewController:viewControllerB animated:YES];
    NSLog(@"Arms : %@",armsScore);
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (void)addItemViewController:(DetailExerciseViewController *)controller didFinishEnteringItem:(NSString *)item
{
    NSLog(@"This was returned from ViewControllerB %@",item);
    armsScore = item;

}

@end