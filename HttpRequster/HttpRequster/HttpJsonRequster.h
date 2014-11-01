//
//  HttpRequster.h
//  HttpRequster
//
//  Created by Slavi on 11/1/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataReciever.h"

@interface HttpJsonRequster : NSObject

-(void)postRequest:(NSString*)fullUrl
           headers:(NSDictionary*)headers
              data:(NSData*)data
        withTarget:(id<DataReciever>)target;

-(void)getRequest:(NSString*)fullUrl
          headers:(NSDictionary*)headers
       withTarget:(id<DataReciever>)target;


-(void)putRequest:(NSString *)fullUrl headers:(NSDictionary *)headers data:(NSData *)data withTarget:(id<DataReciever>)target;

-(void)deleteRequest:(NSString *)fullUrl headers:(NSDictionary *)headers withTarget:(id<DataReciever>)target;

@end
