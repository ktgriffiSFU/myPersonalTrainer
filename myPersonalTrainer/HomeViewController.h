//
//  HomeViewController.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-11.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface HomeViewController: UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

//Item(Cell)
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;



//Item(Cell)
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

//Item(Cell)
- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath;
//Object Library
//1. Collection View - (Base View, TableView.) where you put everything, container
//2. Collection View Cell - (Collection View Item, TableViewCell.) put the options
//3. Collection Reusable View  - (Header View) where you put the quote
@end