
//
//  Workout.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-12-17.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Workout : NSObject

@property (nonatomic, strong) NSString *name; // name of recipe
@property (nonatomic, strong) NSString *time; // preparation time
@property (nonatomic, strong) NSString *image; // image filename of recipe
@property (nonatomic, strong) NSArray *equipmentRequired;
@property (nonatomic, strong) NSArray *musclesTargeted;
@property (nonatomic, strong) NSString *difficultyLevel;


@end