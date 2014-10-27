//
//  Skill.m
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Skill.h"

@implementation Skill

-(instancetype)initWithName: (NSString*)name powerCost:(NSInteger)power damage:(NSInteger)damage{
    self = [super init];
    if (self != nil) {
        self.name = name;
        self.powerCost = power;
        self.damage = damage;
    }
    
    return self;
}

-(NSString*)description{
    NSString *desc = [[NSString alloc] initWithFormat:@"%@(damage: %li; power cost: %li)", self.name, self.damage, self.powerCost];
    return desc;
}

@end