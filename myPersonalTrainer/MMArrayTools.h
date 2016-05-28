//
//  MMArrayTools.h
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-28.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MMArrayTools)

- (NSArray *)mapWithBlock:(id (^)(id object))block;
- (NSArray *)filterWithBlock:(BOOL (^)(id object))block;
- (NSArray *)uniqueObjects;
@end

