//
//  Calculator.m
//  Methods
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

@implementation Calculator

-(instancetype)init{
    self = [super init];
    if (self) {
        self.result = @0;
    }
    
    return self;
}

-(instancetype)initWithStartResult:(NSNumber*)startValue{
    Calculator *calc = [[Calculator alloc] init];
    calc.result = startValue;
    return calc;
}

-(NSNumber*)addToResult:(NSNumber*)num{
    self.result = @([self.result floatValue] + [num floatValue]);
    return self.result;
}

-(NSNumber*)substractFromResult:(NSNumber *)num{
    self.result = @([self.result floatValue] - [num floatValue]);
    return self.result;
}

-(NSNumber*)multiplyWithResult:(NSNumber *)num{
    self.result = @([self.result floatValue] * [num floatValue]);
    return self.result;
}

-(NSNumber*)divideResult:(NSNumber *)num{
    self.result = @([self.result floatValue] / [num floatValue]);
    return self.result;
}

@end
