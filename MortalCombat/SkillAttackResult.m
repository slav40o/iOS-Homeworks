//
//  SkillAttackResult.m
//  MortalCombat
//
//  Created by Slavi on 10/27/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkillAttackResult.h"

@implementation SkillAttackResult

-(instancetype)initWithStatus:(NSString *)resultStatus andMessage:(NSString *)message{
    self = [super init];
    if (self != nil) {
        self.resultStatus = resultStatus;
        self.message = message;
    }
    
    return self;
}

@end