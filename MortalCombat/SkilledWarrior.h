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

@protocol SkilledWarrior

@property NSArray* skills;

-(void)useSkill:(NSString*)skillName toOponent:(NSObject<SkilledWarrior>*)oponent;
-(NSArray*)listSkills;

@end
