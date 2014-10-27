//
//  main.m
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reptile.h"
#import "Cyrax.h"
#import "Arena.h"
#import "AttackType.h"
#import "GameState.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Reptile *rept = [[Reptile alloc]init];
        NSLog(@"%@", [rept listSkills]);
        
        Cyrax *myCyrax = [Cyrax new];
        NSLog(@"%@", [myCyrax listSkills]);
        
        Arena *battle = [[Arena alloc] initWithFirstPlayer:rept andSecondPlayer:myCyrax];
        [battle firstPlayerBasicAttack: KICK];
        [battle secondPlayerSkillAttack:@"Cyberdriver"];
    }
    
    return 0;
}
