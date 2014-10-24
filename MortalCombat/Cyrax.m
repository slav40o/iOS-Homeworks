//
//  Cyrax.m
//  MortalCombat
//
//  Created by Slavi on 10/24/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cyrax.h"
#import "Skill.h"

@implementation Cyrax

NSInteger maxPower = 350;
NSInteger lifePoints = 350;
NSString *name = @"Cyrax";

-(instancetype)init{
    NSArray *skills = @[
        [[Skill alloc] initWithName:@"Sticky Bomb" powerCost:70 damage:60],
        [[Skill alloc] initWithName:@"Saw Blade" powerCost:50 damage:35],
        [[Skill alloc] initWithName:@"Cyberdriver" powerCost:80 damage:70]
    ];
    
    self = [super initWithName:name lifePoints:lifePoints andPower:maxPower];
    if (self != nil) {
        self.skills = skills;
    }
    
    return self;
}


// overrides kick, takes more power from it
-(void)kick:(Character*)oponent{
    oponent.life -= self.kickPower;
    self.power += self.kickPower / 2 + 10;
    if (self.power > maxPower) {
        self.power = maxPower;
    }
}

@end