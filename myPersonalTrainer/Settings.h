
//
//  Settings.h
//  myPersonalTrainer
//
//  Created by Kyle Griffith on 2015-11-23.
//  Copyright © 2015 Kyle Griffith. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Settings : NSObject

+ (instancetype)defaultSettings;

@property (nonatomic, assign) BOOL shouldSkipLogin;

@end
