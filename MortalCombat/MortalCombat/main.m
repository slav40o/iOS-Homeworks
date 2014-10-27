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
        NSLog(@"%@", rept.name);
        
        Cyrax *myCyrax = [Cyrax new];
        NSLog(@"%li", myCyrax.kickPower);
        
        
    }
    
    return 0;
}
