////
////  ParnerProfileViewController.m
////  fitSFU
////
////  Created by Kyle Griffith on 2016-05-09.
////  Copyright © 2016 Kyle Griffith. All rights reserved.
////
//
//
//#import "PartnerProfileViewController.h"
//#import <Foundation/Foundation.h>
//#import <MessageUI/MessageUI.h>
//
//@interface PartnerProfileViewController ()<MFMailComposeViewControllerDelegate>
//@end
//
//@implementation PartnerProfileViewController{
//    
//    
//}
//@synthesize parterSummary,partnerName,partnerSummary,partnerTimes,rowNumber;
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self createViews];
//}
//
//-(void) createViews{
//    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
//    CGFloat top=self.navigationController.navigationBar.frame.size.height;
//    
// //   NSArray *icons=[self createArraysPlist:@"Icons"];
//  //  NSArray *names=[self createArraysPlist:@"Names"];
// //   NSArray *summary=[self createArraysPlist:@"Fact Sheet"];
//    
//    
//    CGFloat width = screenwidth/2;
//    CGFloat buttonHeight=screenheight*.105;
//    UIImageView *image1 =[[UIImageView alloc] initWithFrame:CGRectMake(0,top,screenwidth*1/2,screenwidth*1/2)];
// //   image1.image=[UIImage imageNamed:[icons objectAtIndex:rowNumber]];
//    [self.view addSubview:image1];
//    
//    
//    
//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button1 addTarget:self
//                action:@selector(showEmail)
//      forControlEvents:UIControlEventTouchUpInside];
//    [button1 setTitle:@"CONTACT" forState:UIControlStateNormal];
//    button1.frame = CGRectMake(0, screenheight*.809, screenwidth,buttonHeight );
//    [button1 setBackgroundColor:[UIColor redColor]];
//    button1.titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
//    
//    [self.view addSubview:button1];
//    
//    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(width,top,width,width)];
//   // nameLabel.text=[names objectAtIndex:rowNumber];;
//    nameLabel.backgroundColor =[UIColor clearColor];
//    [nameLabel setFont:[UIFont fontWithName:@"Avenir" size:50]];
//    nameLabel.numberOfLines = 2;
//    nameLabel.textAlignment = NSTextAlignmentLeft;
//    nameLabel.adjustsFontSizeToFitWidth=YES;
//    nameLabel.minimumScaleFactor=0.5;
//    
//    [self.view addSubview:nameLabel];
//
//    UILabel *summaryLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenwidth/16,width,screenwidth*14/16,screenheight*7/8-width)];
////    summaryLabel.text=[summary objectAtIndex:rowNumber];
//    summaryLabel.backgroundColor =[UIColor clearColor];
//    [summaryLabel setFont:[UIFont fontWithName:@"Avenir" size:15]];
//    summaryLabel.numberOfLines = 20;
//    summaryLabel.textAlignment = NSTextAlignmentLeft;
//    summaryLabel.adjustsFontSizeToFitWidth=YES;
//    summaryLabel.minimumScaleFactor=0.5;
//    
//    [self.view addSubview:summaryLabel];
//    
//}
//-(void)showEmail
//{
//    if (![MFMailComposeViewController canSendMail])
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                        message:@"Can't send mail right now"
//                                                       delegate:nil
//                                              cancelButtonTitle:nil
//                                              otherButtonTitles:@"Ok", nil];
//        [alert show];
//        return;
//    }
////    NSArray *names=[self createArraysPlist:@"Names"];
//    
//    NSString *trainer=[names objectAtIndex:rowNumber];
//    // Email Subject
//    NSString *emailTitle = @"Trainer Inquiry";
//    // Email Content
//    NSString *messageBody = [NSString stringWithFormat: @"I am interested in training with %@\n",trainer];
//    // To address
//    NSArray *toRecipents = [NSArray arrayWithObject:@"deraddikt@icloud.com"];
//    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
//    mc.mailComposeDelegate = self;
//    [mc setSubject:emailTitle];
//    [mc setMessageBody:messageBody isHTML:NO];
//    [mc setToRecipients:toRecipents];
//    [self presentViewController:mc animated:YES completion:nil];
//}
//-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//@end
//
