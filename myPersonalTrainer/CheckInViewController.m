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
}
@synthesize signInCode;
@synthesize serverResponse;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (IBAction)submitButton:(UIButton *)sender {
   // BOOL newWorkout = [self checkIfNewDay];
    bool testing = true;
    if (testing) {
        [self sendCode];
    }else{
        serverResponse.text = @"You already checked in";
    }
    
    //compare code with json file for that day
}
- (void) sendCode{
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
    if(conn)
    {
        NSLog(@"Good");
    }
    else
    {
        NSLog(@"Bad");
    }
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    // Log Response
    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",response);
    NSLog(@"%@",myRequestString);
}
- (BOOL)checkIfNewDay{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss-dd-MM-yyyy"];

    NSString *dateString = [[NSUserDefaults standardUserDefaults] stringForKey:@"timeIn"];

    methodStart = [dateFormatter dateFromString:dateString];
    methodEnd = [NSDate date];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

