//
//  Character.m
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "SkillAttackResult.h"

@implementation Character

@synthesize skills;
const NSInteger kickDamage = 20;
const NSInteger punchDamage = 15;
NSInteger maxPower;

-(instancetype)initWithName: (NSString*)name lifePoints:(NSInteger)life andPower:(NSInteger)power{
    self = [super init];
    if (self != nil) {
        self.name = name;
        self.power = power;
        self.maxPower = power;
        self.life = life;
        self.kickPower = kickDamage;
        self.punchPower = punchDamage;
    }
    
    return self;
}

-(void)kick:(Character*)oponent{
    oponent.life -= self.kickPower;
    self.power += self.kickPower / 2;
    if (self.power > self.maxPower) {
        self.power = self.maxPower;
    }
}

-(void)punch:(Character*)oponent{
    oponent.life -= self.punchPower;
    self.power += self.punchPower / 2;
    if (self.power > self.maxPower) {
        self.power = self.maxPower;
    }
}

Skill* findSkill (NSString* skill, NSArray *skillsList){
    Skill* foundSkill;
    
    for (int i = 0; i < skillsList.count; i++) {
        if ([[skillsList[i] name] isEqualToString:skill]) {
            foundSkill = skillsList[i];
            break;
        }
    }
    
    return foundSkill;
}

-(SkillAttackResult*)useSkill:(NSString*)skillName toOponent:(Character*)oponent{
    Skill *skill = findSkill(skillName, self.skills);
    NSString *status;
    NSString *message;
    
    if (skill != nil && self.power - skill.powerCost > 0) {
        oponent.life -= skill.damage;
        self.power -= skill.powerCost;
        status = @"OK";
        message = [[NSString alloc] initWithFormat:@"%@ dealed %li damage to %@ with %@", self.name, skill.damage, oponent.name, skill.name];
    }
    else{
        status = @"ERROR";
        if (skill == nil) {
            message = [[NSString alloc] initWithFormat: @"%@", @"Skill isn't found!"];
        }
        else{
            message = [[NSString alloc] initWithFormat: @"%@", @"Not enough power!"];
        }
    }
    
    SkillAttackResult *result = [[SkillAttackResult alloc] initWithStatus:status andMessage:message];
    return result;
}

-(NSArray*)listSkills{
    return self.skills;
}

@end