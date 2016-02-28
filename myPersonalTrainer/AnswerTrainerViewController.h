//
//  AnswerTrainerViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-27.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AnswerTrainerViewController : UIViewController

@property (strong,nonatomic) NSMutableString * questionString;
@property (strong,nonatomic) NSMutableString * answerString;


@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
