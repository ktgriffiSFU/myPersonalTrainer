//
//  ViewController.m
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2016-01-19.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//
#import "MMArrayTools.h"

#import <Foundation/Foundation.h>
#import <XCDYouTubeKit/XCDYouTubeVideoPlayerViewController.h>
#import "AppDelegate.h"
#import "ViewController.h"
@interface ViewController ()
@property (nonatomic, strong) UIView *videoView;
@property (nonatomic, strong) XCDYouTubeVideoPlayerViewController *ytPlayer;
@property (nonatomic, assign) UIInterfaceOrientation supportedOrientation;
@property (nonatomic, strong) NSArray *resource;
@property (nonatomic, strong) NSMutableArray *filteredData;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *categories;
@end

@implementation ViewController
{
    
    NSArray *exercises;
    NSArray *pictures;
    NSArray *pictures2;
    NSArray *details;
    NSArray *videoID;
}
@synthesize exerciseImageView;
@synthesize exerciseImageView2;
@synthesize exerciseDetails;
@synthesize rowNumber;
- (instancetype)initWithResource:(NSArray*)resource
{
    self = [super init];
    if (self)
    {
        self.resource = resource;
        self.showDoneButton = NO;
        self.categories = [[resource mapWithBlock:^id(id object) { return object[@"type"]; }] uniqueObjects];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *infoImage=[UIImage imageNamed:@"info.png"];
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc]
                                   initWithImage:infoImage
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(infoView)];
    
    self.navigationItem.rightBarButtonItem = infoButton;
    [self initView];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)initView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Exercises" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    exercises = [dict objectForKey:@"ExerciseName"];
    pictures = [dict objectForKey:@"Thumbnail"];
    pictures2 = [dict objectForKey:@"Thumbnail2"];
    details = [dict objectForKey:@"Details"];
    videoID =[dict objectForKey:@"VideoID"];
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat width = screenwidth/2;
    UIButton *videoSelected=[[UIButton alloc] initWithFrame:CGRectMake(0, 67, screenwidth, width)];
    [videoSelected addTarget:self
                      action:@selector(startVideo)
            forControlEvents:UIControlEventTouchUpInside];
    UIImageView *image1 =[[UIImageView alloc] initWithFrame:CGRectMake(0,67,width,width)];
    UIImageView *image2 =[[UIImageView alloc] initWithFrame:CGRectMake(width,67, width,width)];
    image1.image=[UIImage imageNamed:[pictures objectAtIndex:rowNumber]];
    image2.image=[UIImage imageNamed:[pictures2 objectAtIndex:rowNumber]];
    [self.view addSubview:image1];
    [self.view addSubview:image2];
    [self.view addSubview:videoSelected];
    self.exerciseImageView.image = [UIImage imageNamed:[pictures objectAtIndex:rowNumber]];
    self.exerciseImageView2.image = [UIImage imageNamed:[pictures2 objectAtIndex:rowNumber]];
    self.exerciseDetails.text =[details objectAtIndex:rowNumber];
    self.title = [exercises objectAtIndex:rowNumber];
}
-(void)startVideo{
    [self showVideoViewWithVideoId:[videoID objectAtIndex:rowNumber]];

}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:[UIDevice currentDevice]];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleWillExitBackgroundNotification)
                                                 name:MPMoviePlayerWillExitFullscreenNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerDidExitFullScreenCallback:) name:MPMoviePlayerDidExitFullscreenNotification object:self.ytPlayer];
    
}




-(void)infoView{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Learn Exercise"
                          message:@"This is where you can gain information on the exercise."
                          delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
    
    
}
- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationLandscapeLeft:
            
            self.ytPlayer.moviePlayer.fullscreen=YES;
            break;
        case UIDeviceOrientationLandscapeRight:
            
            self.ytPlayer.moviePlayer.fullscreen=YES;
            
            break;
        default:
            break;
    };
}
-(void) restrictRotation:(BOOL) restriction
{
    AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.restrictRotation = restriction;
}
-(void)didTapOutsideVideo:(id)sender
{
    if (self.videoView) [self removeVideo];
}


-(void)showVideoViewWithVideoId:(NSString *)videoID
{
    [self restrictRotation:NO];
    
    XCDYouTubeVideoPlayerViewController *ytPlayerVc = [[XCDYouTubeVideoPlayerViewController alloc]
                                                       initWithVideoIdentifier:videoID];
    UIView *videoView = [[UIView alloc] initWithFrame:self.view.bounds];
    UIView *backgroundView = [[UIView alloc] initWithFrame:videoView.bounds];
    backgroundView.alpha = 0;
    backgroundView.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(didTapOutsideVideo:)];
    [backgroundView addGestureRecognizer:tapRecognizer];
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;

    UIView *movieView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                                 screenwidth,
                                                                 screenwidth * 9.0/16)];
    movieView.center = self.view.center;
   
    [videoView addSubview:backgroundView];
    [videoView addSubview:movieView];
    [self.view addSubview:videoView];
    
    [UIView animateWithDuration:0.25 animations:^{
        backgroundView.alpha = 0.8;
    }];
    
    [ytPlayerVc presentInView:movieView];
    [ytPlayerVc.moviePlayer play];
    
    self.videoView = videoView;
    self.ytPlayer = ytPlayerVc;
    
    
}

-(void)removeVideo
{
    [self.ytPlayer.moviePlayer stop];
    [self.videoView removeFromSuperview];
    self.ytPlayer = nil;
    self.videoView = nil;
    [self restrictRotation:YES];
}
- (void)handleWillExitBackgroundNotification
{
    [self restrictRotation:YES];
    
}
-(void)doneButtonTapped:(UIButton *)sender
{
    [self removeVideo];
}

-(void)viewDidDisappear:(BOOL)animated
{
    static const NSUInteger thisTabIndex = 1;
    if (self.videoView &&
        self.tabBarController.selectedIndex != thisTabIndex)
    {
        [self removeVideo];
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:UIDeviceOrientationDidChangeNotification];
    
    [super viewDidDisappear:animated];
}


-(NSString*)videoIdForResourceAtIndexPath:(NSIndexPath*)indexPath {
    
    return [self.resource objectAtIndex:indexPath.row][@"video_id"];
}
- (void) moviePlayerDidExitFullScreenCallback:(NSNotification *)aNotification {
    
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(setStatusBarVisible:) userInfo:nil repeats:NO];
    
}
- (void) setStatusBarVisible: (NSTimer *)timer {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}
@end

