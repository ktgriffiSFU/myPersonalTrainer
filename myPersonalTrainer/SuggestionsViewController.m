//
//  SuggestionsViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-26.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import "SuggestionsViewController.h"
#import <Foundation/Foundation.h>
@interface SuggestionsViewController ()

@end

@implementation SuggestionsViewController{

}
@synthesize suggestionField;

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)submitButton:(UIButton *)sender {
    if (suggestionField.text.length==0) {
        [self Alert:@"Please enter a suggestion":@"Error"];
    }else{
    [self sendSuggestion];
    [self Alert:@"Your suggestion has been sent":@"Thank you"];
    }
}
- (void) sendSuggestion{
    NSString *usersSuggestion=suggestionField.text;
    NSURL *url = [NSURL URLWithString:@"https://docs.google.com/forms/d/1R3ACuURjGV8u1Z2N5AJ1b8Icdoi5XWxLlJR-23ihqsM/formResponse"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    NSString *postData = [NSString stringWithFormat:@"entry.1478488883=%@",usersSuggestion];    //set request content type we MUST set this value.
    [request setValue:@"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //start the connection
    [connection start];
    
}

- (void) Alert:(NSString *)message :(NSString*)Title {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Title message:message delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
    
}
@end