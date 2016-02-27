
//
//  StatTable.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-22.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatTable.h"
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
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [statOptions count];
}
    
@end

