
//
//  ExerciseViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-28.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseViewController.h"
@interface ExerciseViewController ()

@end

@implementation ExerciseViewController

{
    NSArray *exercises;
    NSArray *pictures;
    NSArray *targetedMuscle;
    NSArray *details;
}


@synthesize exerciseImageView;
@synthesize exerciseImageName;
@synthesize exerciseDetails;
@synthesize rowNumber;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Exercise viewcontroller loaded");
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    exercises = [dict objectForKey:@"ExerciseName"];
    pictures = [dict objectForKey:@"Thumbnail"];
    targetedMuscle = [dict objectForKey:@"TargetedMuscle"];
    details = [dict objectForKey:@"Details"];
    
   
    NSString *rowstring = [NSString stringWithFormat:@"%d", rowNumber];
    printf("Row is:%s", [rowstring UTF8String]);

    self.exerciseImageView.image = [UIImage imageNamed:[pictures objectAtIndex:rowNumber]];
    self.exerciseImageName.text =[exercises objectAtIndex:rowNumber];
    self.exerciseDetails.text =[details objectAtIndex:rowNumber];
    NSLog(@"Exercise is: %@",exerciseImageName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
