//
//  MenuCell.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-11.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuCell.h"


@implementation MenuCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) { return nil; }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) { return nil; }
        
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

@end
