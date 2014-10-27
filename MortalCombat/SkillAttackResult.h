//
//  SkillAttackResult.h
//  MortalCombat
//
//  Created by Slavi on 10/27/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkillAttackResult : NSObject

-(instancetype)initWithStatus:(NSString*)resultStatus andMessage:(NSString*)message;

@property NSString *resultStatus;
@property NSString *message;

@end
