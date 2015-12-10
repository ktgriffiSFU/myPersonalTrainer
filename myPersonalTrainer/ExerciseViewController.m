
//
//  ExerciseViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-28.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseViewController.h"
#import "TableViewController.h"
@interface ExerciseViewController ()

@end

@implementation ExerciseViewController

{
    NSArray *exercises;
    NSArray *thumbnails;
    NSArray *targetedMuscle;
}


@synthesize exerciseImageView;
@synthesize exerciseImageName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.exerciseImageView.image = [UIImage imageNamed:self.exerciseImageName];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    exercises = [dict objectForKey:@"ExerciseName"];
    thumbnails = [dict objectForKey:@"Thumbnail"];
    targetedMuscle = [dict objectForKey:@"TargetedMuscle"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
