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
    NSDate *methodEnd;
    NSString *userName;
    NSString *countString;
    NSString *oldDateString;
    bool *post;
    NSString *signInKey;
    int countInt;
}
@synthesize signInCode;
@synthesize serverResponse;

- (void)viewDidLoad {
    post=false;
    [super viewDidLoad];
    [self CheckNewMonth];
    [self getCode];

    if (methodStart==nil) {
        countInt=0;
    }

}
-(void)CheckNewMonth{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM"];
    NSDate *today = [NSDate date];
    NSString *todaysDateString = [dateFormatter stringFromDate:today];
    NSInteger todayInt = [todaysDateString integerValue];
    NSInteger oldDayInt = [oldDateString integerValue];

    if (oldDayInt==todayInt||countString!=nil) {
        countString =[[NSUserDefaults standardUserDefaults] stringForKey:@"countIn"];
    }else if (oldDayInt<todayInt){
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
    if (executionTime>50400 || methodStart==nil) {
        methodStart = [NSDate date];
        NSString *stringDate = [dateFormatter stringFromDate:[NSDate date]];
        [[NSUserDefaults standardUserDefaults] setObject:stringDate forKey:@"timeIn"];
        return true;
    }else{
        return false;
    }
    
    
    
}

- (IBAction)submitButton:(UIButton *)sender {
    // BOOL newWorkout = [self checkIfNewDay];
    bool testing = true;
    if (signInCode.text==signInKey) {
        if (testing) {
            countInt= [self findCount];
            [self sendNameAndCount];
            [self Alert:@"Your signed in"];
        }else{
            [self Alert:@"You already signed in today."];
        }
    }else{
        [self Alert:@"This is not the sign in code"];
    }
    
    //compare code with json file for that day
}
- (int) findCount {
    int count=0;
    
    return count;
}
- (void) sendNameAndCount{
    NSURL *url = [NSURL URLWithString:@"https://docs.google.com/forms/d/1B_UL1SVVJKNs3_GkpZrUPmx1ZZ9sRRlidigRrdcoffk/formResponse"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    //initialize a post data
    NSString *postData = [NSString stringWithFormat:@"entry.109476061=%@&entry.331541576=%@",userName,countString];    //set request content type we MUST set this value.
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end