//
//  MMArrayTools.m
//  fitSFU
//
//  Created by Kyle Griffith on 2016-05-28.
//  Copyright © 2016 Kyle Griffith. All rights reserved.
//


#import "MMArrayTools.h"

@implementation NSArray (MMArrayTools)

- (NSArray *)mapWithBlock:(id (^)(id object))block
{
    if (block)
    {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
        for (id object in self)
        {
            id replacement = block(object);
            if (replacement) [array addObject:replacement];
        }
        return array;
    }
    return [NSArray arrayWithArray:self];
}

- (NSArray *)filterWithBlock:(BOOL (^)(id object))block
{
    if (!block) return [NSArray arrayWithArray:self];
    
    NSMutableArray *array = [NSMutableArray array];
    for (id object in self)
    {
        BOOL result = block(object);
        if (result) [array addObject:object];
    }
    
    return array;
}

- (NSArray *)uniqueObjects
{
    return [[NSOrderedSet orderedSetWithArray:self] array];
}

@end
