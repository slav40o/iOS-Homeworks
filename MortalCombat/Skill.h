//
//  Skill.h
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Skill : NSObject

-(instancetype)initWithName: (NSString*)name powerCost:(NSInteger)power damage:(NSInteger)damage;

@property (strong) NSString *name;
@property NSInteger powerCost;
@property NSInteger damage;

-(NSString*)description;

@end
