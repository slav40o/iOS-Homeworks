//
//  Arena.h
//  MortalCombat
//
//  Created by Slavi on 10/27/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "AttackType.h"
#import "GameState.h"

@interface Arena : NSObject

-(instancetype)initWithFirstPlayer:(Character*)first andSecondPlayer:(Character*)secondPlayer;

@property (strong, nonatomic) Character *firstPlayer;
@property (strong, nonatomic) Character *secondPlayer;
@property (nonatomic, assign) enum GameState gameState;

-(void)firstPlayerBasicAttack:(enum AttackType) attackType;
-(void)secondPlayerBasicAttack:(enum AttackType) attackType;
-(void)firstPlayerSkillAttack:(NSString*) skillName;
-(void)secondPlayerSkillAttack:(NSString*) skillName;

@end