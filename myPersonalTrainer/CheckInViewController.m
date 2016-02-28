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
    NSDate *methodStart;
    NSDate *methodEnd,*oldTime;
    NSString *userName;
    NSString *countString;
    NSString *oldDateString;
    bool *post;
    NSString *signInKey;
    int countInt;
}
@synthesize signInCode;
@synthesize nameField,nameLabel,welcomeLabel;

- (void)viewDidLoad {

    post=false;
    [super viewDidLoad];
    userName=[[NSUserDefaults standardUserDefaults] stringForKey:@"userName"];
    if (userName==nil) {
        nameField.hidden= NO;
        nameLabel.hidden= NO;
    }else{
        nameField.hidden= YES;
        nameLabel.hidden= YES;
        welcomeLabel.hidden=NO;
        NSString *welcomeText =[NSString stringWithFormat:@"Welcome back %@",userName];
        welcomeLabel.text=welcomeText;
    }
    [self CheckNewMonth];
    [self getCode];
    NSLog(@"%@",signInKey);
}
- (IBAction)submitButton:(UIButton *)sender {
    BOOL newWorkout = [self checkIfNewDay];
    if (userName==nil) {
        [self getUserName];
    }else{
        userName=[[NSUserDefaults standardUserDefaults]stringForKey:@"userName"];
    }
    if ([signInCode.text isEqualToString:signInKey]) {
        if (newWorkout) {
            [self findCount];
            NSLog(@"ToSend: %@",countString);
            oldTime = [NSDate date];
            [self sendNameAndCount];
            [self Alert:@"Your signed in. Keep on signing in for chances to win the consistency challenge."];
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
}
-(void)CheckNewMonth{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSDate *today = [NSDate date];
    NSString *todaysDateString = [dateFormatter stringFromDate:today];
    NSString *lastDayString =[dateFormatter stringFromDate:oldTime];
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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss-dd-MM-yyyy"];
    
    NSString *dateString = [[NSUserDefaults standardUserDefaults] stringForKey:@"timeIn"];
    
    methodStart = [dateFormatter dateFromString:dateString];
    methodEnd = [NSDate date];
    NSDateFormatter *month = [[NSDateFormatter alloc] init];
    oldDateString = [month stringFromDate:methodEnd];
    NSTimeInterval executionTime = [methodEnd timeIntervalSinceDate:methodStart];
    //
    if (executionTime>10*60*60 || methodStart==nil) {
        methodStart = [NSDate date];
        NSString *stringDate = [dateFormatter stringFromDate:[NSDate date]];
        [[NSUserDefaults standardUserDefaults] setObject:stringDate forKey:@"timeIn"];
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
    NSString *myRequestString = [NSString stringWithFormat:@"string=%@&",signInCode.text];
    
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
    NSLog(signInKey);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end