//
//  HomeViewController.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-11.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeViewController.h"
#import "MenuCell.h"
@interface HomeViewController()

@end

@implementation HomeViewController
{
    
    NSArray *miscChoices;
    NSArray *choiceIcons;
    NSArray *choiceIdentifier;
    
}

@synthesize collectionView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Section Size... Layout Setting...
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //top 20, left, bottom 20, right
    miscChoices= [[NSArray alloc]
                  initWithObjects:
                  @"Check In",@"Trainer \nAnswers",@"Code Of Conduct",
                  @"Find a \nTrainer",@"Settings",@"Group\nFitness",
                  @"Find a \nPartner",@"Ask a \nTrainer",@"Ask for \na Partner", nil];
    choiceIcons=[[NSArray alloc]
                 initWithObjects:
                 @"CheckIn.png",@"TrainerAnswers.png",@"CodeOfConduct.png",
                 @"FindATrainer.png",@"Settings.png",@"GroupFitness.png",
                 @"FindAPartner.png",@"AskATrainer.png",@"AskForAPartner.png",nil];
    choiceIdentifier=[[NSArray alloc]
                 initWithObjects:
                 @"CheckIn",@"TrainerAnswers",@"CodeOfConduct",
                 @"FindATrainer",@"Settings",@"GroupFitness",
                 @"FindAPartner",@"Suggestions",@"AskForAPartner",nil];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MenuCell"];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];


}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
// Section for Item Count...
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSString *cellNumberString =@"0";
    [[NSUserDefaults standardUserDefaults] setObject:cellNumberString forKey:@"cellNumber"];
    return 3;
}
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}
- (UICollectionViewCell *)tableView:(UICollectionView *)collectionView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"MenuCell";
    
    MenuCell *cell = (MenuCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    
    
    return cell;
}
// CollectionViewCell Item Create...
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellNumberString=[[NSUserDefaults standardUserDefaults] objectForKey:@"cellNumber"];
    int cellInt=[cellNumberString intValue];

    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCell" forIndexPath:indexPath];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    imgView.image = [UIImage imageNamed:[choiceIcons objectAtIndex:cellInt]];
    
    [cell.contentView addSubview:imgView];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 80, 60)];
    lable.text=[miscChoices objectAtIndex:cellInt];
    [lable setFont:[UIFont fontWithName:@"Avenir" size:17]];
    lable.adjustsFontSizeToFitWidth=YES;
    lable.minimumScaleFactor=0.5;

    lable.numberOfLines = 2;

    cellInt++;

    lable.textColor=[UIColor blackColor];
    [cell.contentView addSubview:lable];
    cellNumberString = [@(cellInt) stringValue];

    [[NSUserDefaults standardUserDefaults] setObject:cellNumberString forKey:@"cellNumber"];
    return cell;
}

// Section Header Create...
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        
        UICollectionReusableView *rView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 60)];
        
        [lable setText:[NSString stringWithFormat:@"SFU is the cleanest gym in Canada\n-Catherine Bunagan"]];
        [lable setTextAlignment:NSTextAlignmentCenter];
        lable.textColor=[UIColor whiteColor];
        lable.numberOfLines = 2;

        [lable setFont:[UIFont systemFontOfSize:16.0f]];
        [lable setBackgroundColor:[UIColor redColor]];
        if (indexPath.section==0) {
            [rView addSubview:lable];

        }
        
        return rView;
    }
    return Nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(CGRectGetWidth(self.collectionView.bounds), 60);

    }else {
        return CGSizeZero;
    }
}
// Select Item...
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index;
    if (indexPath.section==0) {
        index=indexPath.row;
    }else if (indexPath.section==1){
        index=indexPath.row+3;
    }else {
        index=indexPath.row+6;
    }
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];

    NSLog(@"did SelectItem %@",[choiceIdentifier objectAtIndex:index]);



    [self performSegueWithIdentifier:[choiceIdentifier objectAtIndex:index] sender:self];

}

// De Select Item...
- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did De selectItem %d-%d",indexPath.section,indexPath.row);
    
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    

}
@end
