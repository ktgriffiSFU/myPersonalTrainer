//
//  CodeOfConductViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-26.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//
#import "CodeOfConductViewController.h"
#import <Foundation/Foundation.h>
@interface CodeOfConductViewController ()

@end

@implementation CodeOfConductViewController{

    NSString *cocString;
    UIScrollView *myScrollView;
}
@synthesize scrollView;
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    cocString=@" SFU Recreation is a unique community of students, staff, faculty, and the public connected by active living and leadership development. Our Code of Conduct is in place to create an environment that is safe, friendly and inclusive for everyone.\n\n Membership with SFU Recreation is a privilege. All members are expected to:\nEnter only through the Fitness Center main door upstairs.\nBring your ID Card (SFU, FIC or R&A ID) or other membership authorization and sign in at the front desk. You cannot use the Fitness Centre without first signing in with some form of membership authorization.\n\nRespect your fellow members and Fitness Centre staff.\nBe courteous to Fitness Centre staff and other members and share equipment where possible.\nYou must sign up for cardio machines using the cardio sign-up boards. Maximum 30 minutes per machine; your reservation is void if you are more than 5 minutes late.\n\nUse the Fitness Centre equipment safely. Do not use equipment for purposes other than what they were designed for.\nDo not drop weights.\nDo not place weights on benches and other upholstery.\nUse bar collars and spotters where appropriate.\nReturn equipment when you are finished using it.\nRerack weights plates and dumbbells in their proper location.\nKeep walkways clear of benches and equipment.\nWipe down benches and cardio equipment after use and clean up excess chalk.\n\nUse of the internet on cardio machines with this functionality is done so as per SFU Policy GP-24 - Fair Use of Information and Communication Technology.\n\nNo food, gum or unsealed liquid containers. Report spills to the Weight Room Supervisor.\n\nNo external or private personal training permitted.\n\nAdult supervision (19 years+) is required for members aged 15-16 years old. Members aged 14 and under are not permitted in the Fitness Centre.\n\nDress Code\nWear:\nClean clothing\nClose-toed shoes\nShirts or tank tops covering the nipples, low back and waist\nShorts, tights, etc that cover the buttocks\n\nDo Not Wear:\nHeavy scents or soiled clothing\nOpen-toed shoes (sandals, flip flops, Crocs), high heels, cleats\nCrop tops, 'cutoff' shirts exposing torso, tank tops that expose the nipples, sports bra or no shirt\nJeans, jean shorts (anything denim or with heavy seaming and external metal parts), jeggings, shorts that expose the buttocks\nAny clothing with obscene language or images.\n\nPlease report any injuries, equipment malfunctions, or concerns to Fitness Centre staff.\nMembers found violating the Code of Conduct or University Policies will be warned and may have their membership revoked. You may be asked by staff to produce your ID Card or membership authorization at any time. ";
    myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.view =  myScrollView;

    [self createView];
}

-(void)createView{
    //Big label
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight= [UIScreen mainScreen].bounds.size.height;

  // UIScrollView *cocView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,screenwidth,screenheight)];
    UILabel *cocLabel =[[UILabel alloc] initWithFrame:CGRectMake(0,0,screenwidth,4*screenheight)];
    cocLabel.text=cocString;
    cocLabel.textColor=[UIColor whiteColor];
    cocLabel.backgroundColor =[UIColor redColor];
    [cocLabel setFont:[UIFont fontWithName:@"Avenir" size:24]];
    cocLabel.textAlignment = NSTextAlignmentLeft;
    cocLabel.adjustsFontSizeToFitWidth=YES;
    cocLabel.minimumScaleFactor=0.5;
    cocLabel.numberOfLines=130;
    CGSize pageSize=CGSizeMake(screenwidth, 4*screenheight);
    //ADD MORE: when functionality works
   // [self.view addSubview:cocView];
    [myScrollView addSubview:cocLabel];
    [myScrollView setContentSize:pageSize];

    
}
@end
