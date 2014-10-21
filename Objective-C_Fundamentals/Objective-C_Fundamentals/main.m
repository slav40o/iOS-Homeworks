//
//  main.m
//  Objective-C_Fundamentals
//
//  Created by Slavi on 10/21/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

void printMatrix(NSMutableArray* matrix){
    NSInteger guessInitialCapacity = matrix.count * matrix.count;
    NSMutableString* builder = [NSMutableString stringWithCapacity:guessInitialCapacity];
    [builder appendString:@"\n"];
    
    for (int i = 0; i < matrix.count; i++) {
        for (int j = 0; j < matrix.count; j++) {
            NSString* string = [NSString stringWithFormat:@"%@ ", matrix[i][j]];
            [builder appendString:string];
        }
        
        [builder appendString:@"\n"];
    }
    
    NSLog(@"%@", builder);
}

NSMutableArray* fillMatrixInRound(NSMutableArray* matrix){
    unsigned long int steps = matrix.count * matrix.count;
    unsigned long int size = matrix.count;
    int colum = 0;
    int row = 0;
    int direction = 0;
    
    for (int i = 1; i <= steps; i++)
    {
        //Change of direction [rating isEqual:@0]
        if (direction == 0 && (row >= size || ![matrix[row][colum] isEqual:@0]))
        {
            row--;
            colum++;
            direction = 1;
        }
        else if (direction == 1 && (colum >= size || ![matrix[row][colum] isEqual:@0]))
        {
            colum--;
            row--;
            direction = 2;
        }
        else if (direction == 2 && (row < 0 || ![matrix[row][colum] isEqual:@0]))
        {
            row++;
            colum--;
            direction = 3;
        }
        else if (direction == 3 && (colum < 0 || ![matrix[row][colum] isEqual:@0]))
        {
            colum++;
            row++;
            direction = 0;
        }
        //Enter the number
        matrix[row][colum] = [NSNumber numberWithInteger: i];
        //Next cell
        switch (direction)
        {
            case 0: row++; break;
            case 1: colum++; break;
            case 2: row--; break;
            case 3: colum--; break;
            default:
                break;
        }
    }
    
    return matrix;
}

NSMutableArray* createMatrix(int n){
    NSMutableArray *matrix = [[NSMutableArray alloc] initWithCapacity:n];
    for (int i = 0; i < n; i++) {
        matrix[i] = [[NSMutableArray alloc] initWithCapacity:n];
        
        for (int j = 0; j < n; j++) {
            matrix[i][j] = [NSNumber numberWithInteger: 0];
        }
    }
    
    return matrix;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n = 5;
        NSMutableArray* matrix = createMatrix(n);
        NSMutableArray* filledMatrix  = fillMatrixInRound(matrix);
        printMatrix(filledMatrix);
    }
    
    return 0;
}
