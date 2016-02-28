//
//  AnswerTrainerViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-27.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import "AnswerTrainerViewController.h"
#import <Foundation/Foundation.h>
@interface AnswerTrainerViewController ()

@end

@implementation AnswerTrainerViewController{


}
@synthesize answerLabel,questionLabel;
@synthesize questionString,answerString;
- (void)viewDidLoad {
    [super viewDidLoad];
    questionLabel.text = questionString;
    answerLabel.text = answerString;
    
    NSLog(@"%@",answerString);
}
    
@end