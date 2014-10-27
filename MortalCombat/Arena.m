//
//  Arena.m
//  MortalCombat
//
//  Created by Slavi on 10/27/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Arena.h"
#import "Character.h"
#import "AttackType.h"
#import "GameState.h"
#import "SkillAttackResult.h"

@implementation Arena

-(instancetype)initWithFirstPlayer:(Character*)first andSecondPlayer:(Character*)second{
    self = [super init];
    if (self != nil) {
        self.firstPlayer = first;
        self.secondPlayer = second;
        self.gameState = ACTIVE;
    }
    
    return self;
}

void printResult(SkillAttackResult *result){
    if ([result.resultStatus isEqualToString:@"OK"]) {
        NSLog(@"%@", result.message);
    }
    else{
        NSLog(@"%@", result.resultStatus);
        NSLog(@"%@", result.message);
    }
}

-(void)firstPlayerBasicAttack:(enum AttackType) attackType{
    if (self.gameState != ACTIVE) {
        // TO DO: THROW PROPER EXCEPTION
        return;
    }
    
    if (attackType == KICK) {
        [self.firstPlayer kick:self.secondPlayer];
        NSLog(@"%@ dealed %li damage to %@", self.firstPlayer.name, self.firstPlayer.kickPower, self.secondPlayer.name);
    }
    else if(attackType == PUNCH){
        [self.firstPlayer punch:self.secondPlayer];
        NSLog(@"%@ dealed %li damage to %@", self.firstPlayer.name, self.firstPlayer.punchPower, self.secondPlayer.name);
    }
    
    if (self.secondPlayer.life < 1) {
        self.gameState = FIRST_PLAYER_WON;
        NSLog(@"%@ has won the game", self.firstPlayer.name);
    }
}

-(void)secondPlayerBasicAttack:(enum AttackType) attackType{
    if (self.gameState != ACTIVE) {
        // TO DO: THROW PROPER EXCEPTION
        return;
    }
    
    if (attackType == KICK) {
        [self.secondPlayer kick:self.firstPlayer];
        NSLog(@"%@ dealed %li damage to %@", self.secondPlayer.name, self.firstPlayer.punchPower, self.firstPlayer.name);
    }
    else if(attackType == PUNCH){
        [self.secondPlayer punch:self.firstPlayer];
        NSLog(@"%@ dealed %li damage to %@", self.secondPlayer.name, self.firstPlayer.punchPower, self.firstPlayer.name);
    }
    
    if (self.firstPlayer.life < 1) {
        self.gameState = SECOND_PLAYER_WON;
        NSLog(@"%@ has won the game", self.secondPlayer.name);
    }
}

-(void)firstPlayerSkillAttack:(NSString*) skillName{
    if (self.gameState != ACTIVE) {
        // TO DO: THROW PROPER EXCEPTION
        return;
    }
    
    SkillAttackResult *result = [self.firstPlayer useSkill:skillName toOponent:self.secondPlayer];
    printResult(result);
}

-(void)secondPlayerSkillAttack:(NSString*) skillName{
    if (self.gameState != ACTIVE) {
        // TO DO: THROW PROPER EXCEPTION
        return;
    }
    
    SkillAttackResult *result = [self.secondPlayer useSkill:skillName toOponent:self.firstPlayer];
    printResult(result);
}

@end
