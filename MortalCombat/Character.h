//
//  Character.h
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkilledWarrior.h"

@interface Character : NSObject<SkilledWarrior>

-(instancetype)initWithName: (NSString*)name lifePoints:(NSInteger)life andPower:(NSInteger)power;


@property (strong) NSString *name;
@property NSInteger life;
@property NSInteger power;
@property NSInteger maxPower;
@property NSInteger kickPower;
@property NSInteger punchPower;

-(void)kick:(Character*)oponent;
-(void)punch:(Character*)oponent;
@end
