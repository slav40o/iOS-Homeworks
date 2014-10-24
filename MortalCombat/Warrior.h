//
//  BaseWarior.h
//  MortalCombat
//
//  Created by Slavi on 10/23/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Warrior <NSObject>

-(void)kick:(Character*)oponent;
-(void)punch:(Character*)oponent;

@end
