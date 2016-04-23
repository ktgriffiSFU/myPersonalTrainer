//
//  CheckInViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-02-22.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//
#import "CheckInViewController.h"
#import <Foundation/Foundation.h>
@interface CheckInViewController ()
@end

@implementation CheckInViewController{

    NSString *userName;
    NSString *countString;
    NSDate *oldDate;
    NSString *oldDateString;
    bool *post;
    NSString *signInKey;
    int countInt;
}
@synthesize signInField,submitButton;
@synthesize nameField,welcomeLabel,countLabel;

- (void)viewDidLoad {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    [signInField setDelegate:self];
    [nameField setDelegate:self ];

    [super viewDidLoad];
    oldDate= [[NSUserDefaults standardUserDefaults] objectForKey:@"CONSCIENCE_START_DATE"];

    userName=[[NSUserDefaults standardUserDefaults] stringForKey:@"userName"];
    if (userName==nil) {
        nameField.hidden= NO;
        NSString *firstCheckIn = [NSString stringWithFormat:@"Hello, please enter your name and the sign in code"];
        welcomeLabel.text=firstCheckIn;
    }else{
        nameField.hidden= YES;
    }
    if (userName!=nil) {
        if ([self checkIfNewDay]) {
            signInField.hidden=NO;
            countLabel.hidden=YES;
            welcomeLabel.hidden=NO;
            NSString *welcomeText =[NSString stringWithFormat:@"Welcome back %@",userName];
            welcomeLabel.text=welcomeText;
            
        }else{
            countString =[[NSUserDefaults standardUserDefaults] stringForKey:@"countIn"];
            countLabel.text=countString;
            countLabel.hidden=NO;
            signInField.hidden=YES;
            submitButton.hidden=YES;
            welcomeLabel.hidden=NO;
            NSString *welcomeText =[NSString stringWithFormat:@"%@'s count is",userName];
            welcomeLabel.text=welcomeText;
            
        }

    }
        [self CheckNewMonth];
   // [self getCode];
    signInKey = @"doyoueven";
    NSLog(@"%@",signInKey);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)submitButton:(UIButton *)sender {
    if (userName==nil) {
        [self getUserName];
    }else{
    }
    if ([signInField.text isEqualToString:signInKey]) {
        if ([self checkIfNewDay]) {
            [self findCount];
            NSLog(@"ToSend: %@",countString);
            [self sendNameAndCount];
            [self Alert:@"Your signed in. Keep on signing in for chances to win the consistency challenge."];
            oldDate=[NSDate date];
            [[NSUserDefaults standardUserDefaults]setObject:oldDate forKey:@"CONSCIENCE_START_DATE"];
            countString =[[NSUserDefaults standardUserDefaults] stringForKey:@"countIn"];
            countLabel.text=countString;
            countLabel.hidden=NO;
            signInField.hidden=YES;
            submitButton.hidden=YES;
            NSString *welcomeText =[NSString stringWithFormat:@"%@'s count is",userName];
            welcomeLabel.text=welcomeText;
        }else{
            [self Alert:@"You already signed in today."];
        }
    }else{
        [self Alert:@"This is not the sign in code"];
    }
    
    //compare code with json file for that day
}
-(void)getUserName{
    userName= nameField.text;
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
    if (userName !=nil) {
        nameField.hidden=YES;
    }
}
-(void)dismissKeyboard {
    [signInField resignFirstResponder];
    [nameField resignFirstResponder];
}
-(void)CheckNewMonth{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSDate *today = [NSDate date];
    NSString *todaysDateString = [dateFormatter stringFromDate:today];
    NSString *lastDayString =[dateFormatter stringFromDate:oldDate];
    NSInteger todayMonthInt = [todaysDateString integerValue];
    NSInteger lastDayMonthInt = [lastDayString integerValue];

    if (lastDayMonthInt==todayMonthInt && countString!=nil) {
        countString =[[NSUserDefaults standardUserDefaults] stringForKey:@"countIn"];
    }else{
        countInt=0;
        countString = [@(countInt) stringValue];

    }
}

- (void) Alert:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey" message:message delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (BOOL)checkIfNewDay{
    NSDate * now = [NSDate date];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM dd"];
    NSString *todaysDateString = [dateFormatter stringFromDate:now];
    NSString *lastDayString =[dateFormatter stringFromDate:oldDate];

    if (oldDate==nil||![todaysDateString isEqualToString:lastDayString]) {
        return true;
    }else{
        return false;
    }


    
}

- (void) findCount {
    int count;
    if (countString!=nil) {
        countString =[[NSUserDefaults standardUserDefaults] stringForKey:@"countIn"];
        count=[countString integerValue];
        count++;
    }else{
        count = 1;
    }
    countString =[@(count) stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:countString forKey:@"countIn"];

    
}
- (void) sendNameAndCount{
    NSURL *url = [NSURL URLWithString:@"https://docs.google.com/forms/d/1lEPtb5vme5FWQ-chjHFqsC77KO2NJFALzL9kTZGePWc/formResponse"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    NSString *postData = [NSString stringWithFormat:@"entry.958071991=%@&entry.1384152144=%@",userName,countString];    //set request content type we MUST set this value.
    [request setValue:@"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //start the connection
    [connection start];
    
}
- (void) getCode{
    // Create your request string with parameter name as defined in PHP file
    NSString *myRequestString = [NSString stringWithFormat:@"string=%@&",signInField.text];
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://artistfolio.net/signin.php"]];
    // set Request Type
    [request setHTTPMethod: @"POST"];
    // Set content-type
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    // Set Request Body
    [request setHTTPBody: myRequestData];
    // Now send a request and get Response
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
 
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    // Log Response
    signInKey = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",signInKey);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end