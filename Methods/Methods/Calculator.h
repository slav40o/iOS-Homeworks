//
//  Calculator.h
//  Methods
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Calculator : NSObject

-(instancetype)init;
-(instancetype)initWithStartResult:(NSNumber*)startValue;

@property (strong, nonatomic) NSNumber* result;

-(NSNumber*)addToResult:(NSNumber*)num;
-(NSNumber*)substractFromResult:(NSNumber*)num;
-(NSNumber*)multiplyWithResult:(NSNumber*)num;
-(NSNumber*)divideResult:(NSNumber*)num;

@end