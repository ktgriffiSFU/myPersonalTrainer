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
    UICollectionView* collectionView;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    miscChoices= [[NSArray alloc] initWithObjects:@"Check In",@"Suggestions",@"Ask A Trainer",@"Find A Trainer", nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCollectionViewData) name:UIDocumentStateChangedNotification object:nil];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(160, 100);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    self->collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self->collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    self->collectionView.delegate = self;
    self->collectionView.dataSource = self;
    self->collectionView.bounces = YES;
    [self.view addSubview:self->collectionView];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [miscChoices count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self->collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCell" forIndexPath:indexPath];
    
    MenuCell *collectionViewCell = [miscChoices objectAtIndex:indexPath.row];
    
    UILabel *label = [[UILabel alloc]initWithFrame:cell.bounds];
    label.text = [miscChoices objectAtIndex:indexPath.row];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Avenir" size:30];
    label.textAlignment = NSTextAlignmentCenter;
    [cell addSubview:label];
    
    cell.backgroundColor = [UIColor colorWithRed:1 - (indexPath.row / 30.0f) green:0 blue:1 alpha:1];
    
    return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
@end
