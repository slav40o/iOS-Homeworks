//
//  DataReciever.h
//  HttpRequster
//
//  Created by Slavi on 11/1/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataReciever <NSObject>

-(void)httpResponceRecieve:(NSURLResponse*)response
                      data:(NSData *)data
                      type:(NSString*)type
                     error:(NSError *)connectionError;

@end
