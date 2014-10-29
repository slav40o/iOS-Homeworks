//
//  Password.h
//  Password Generator
//
//  Created by Slavi on 10/28/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Password : NSObject

-(instancetype)initWithName:(NSString*)name password:(NSString*)password andDecryptCode:(NSString*)code;

@property NSString *accountName;
@property NSString *encryptedPass;
@property NSString *decryptionCode;
@property BOOL isCreated;

-(NSString*)decryptPassword:(NSString*)decryptionCode;

@end