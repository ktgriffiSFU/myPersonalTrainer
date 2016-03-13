
//
//  SuggestionsViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-26.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface SuggestionsViewController: UIViewController <NSURLSessionDelegate, UITextViewDelegate>


- (IBAction)submitButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *suggestionField;
@end