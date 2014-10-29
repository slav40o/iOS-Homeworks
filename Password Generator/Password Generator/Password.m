//
//  Password.m
//  Password Generator
//
//  Created by Slavi on 10/28/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Password.h"

@implementation Password

-(instancetype)initWithName:(NSString*)name password:(NSString*)password andDecryptCode:(NSString*)code{
    self = [super init];
    if (self != nil) {
        self.accountName = name;
        self.decryptionCode = code;
        self.isCreated = YES;
        self.encryptedPass = [self encryptPassword:password withEncyptionCode:code];
    }
    
    return self;
}


-(NSString*)decryptPassword:(NSString*)decryptionCode{
    NSString *decrypted = [self encryptPassword:self.encryptedPass withEncyptionCode:decryptionCode];
    return decrypted;
}

// Private methods

-(NSString*)encryptPassword:(NSString*)pass withEncyptionCode:(NSString*)secret{
    NSUInteger passLength = pass.length;
    NSMutableString *encrypted = [[NSMutableString alloc] initWithCapacity:passLength];
    int secretIndex = 0;
    
    if ([secret isEqualToString:@""] || secret == nil) {
        return self.encryptedPass;
    }
    
    for (int i = 0; i < passLength; i++) {
        char encryptedChar = [pass characterAtIndex:i] ^ [secret characterAtIndex:secretIndex];
        [encrypted appendString: [[NSString alloc] initWithFormat:@"%c", encryptedChar]];
        secretIndex++;
        secretIndex = secretIndex % secret.length;
    }
    
    return encrypted;
}

@end