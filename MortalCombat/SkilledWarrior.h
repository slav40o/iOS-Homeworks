//
//  SkilledWarrior.h
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Skill.h"
#import "SkilledWarrior.h"
#import "SkillAttackResult.h"

@protocol SkilledWarrior<NSObject>

@property NSArray* skills;
-(SkillAttackResult*)useSkill:(NSString*)skillName toOponent:(NSObject<SkilledWarrior>*)oponent;
-(NSArray*)listSkills;

@end
