//
//  main.m
//  Methods
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import "ToDo.h"
#import "ToDoList.h"

NSDate* getDate(int day, int month, int year){
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:day];
    [components setMonth:month];
    [components setYear:year];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:components];
    return date;
}

void executeCalculator(){
    Calculator *calc = [[Calculator alloc] init];
    NSLog(@"%@", calc.result);
    
    [calc addToResult: @4.5];
    NSLog(@"%@", calc.result);
    
    [calc substractFromResult:@3.2];
    NSLog(@"%@", calc.result);
    
    [calc divideResult:@2];
    NSLog(@"%@", calc.result);
    
    // It also returns the value
    NSNumber *result = [calc multiplyWithResult: @5];
    NSLog(@"%@", result);
}

void executeToDoList(){
    ToDoList *list = [[ToDoList alloc] initWithSize:5];
    
    NSDate *date = getDate(26, 10, 2014);
    NSString *homework = @"To do my homework!";
    ToDo *doHomeWork = [[ToDo alloc] initWithEndDate:date andToDo: homework];
    [list addToDo:doHomeWork];
    NSLog(@"%lu", (unsigned long)[list getCount]);

    
    NSDate *cleanCarDate = getDate(24, 10, 2014);
    NSString *cleanCar = @"To clean my car!";
    ToDo *cleanCarTask = [[ToDo alloc] initWithEndDate:cleanCarDate andToDo: cleanCar];
    [list addToDo:cleanCarTask];
    NSLog(@"%lu", (unsigned long)[list getCount]);
    
    NSArray *tasks = [list allToDos];
    NSLog(@"%@", tasks);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        executeCalculator();
        executeToDoList();
    }
    
    return 0;
}