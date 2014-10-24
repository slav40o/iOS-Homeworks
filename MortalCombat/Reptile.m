//
//  Reptile.m
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reptile.h"
#import "Skill.h"

@implementation Reptile



-(instancetype)init{
    NSArray *skills = @[
        [[Skill alloc] initWithName:@"Acid Hand" powerCost:50 damage:30],
        [[Skill alloc] initWithName:@"Acid Spit" powerCost:60 damage:40],
        [[Skill alloc] initWithName:@"Hybrid Blast" powerCost:70 damage:50]
    ];
    
    self = [super initWithName:@"Reptile" lifePoints:400 andPower:300];
    if (self != nil) {
        self.skills = skills;
    }
    
    return self;
}

@end