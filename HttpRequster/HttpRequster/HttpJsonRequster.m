//
//  HttpRequster.m
//  HttpRequster
//
//  Created by Slavi on 11/1/14.
//  Copyright (c) 2014 Slavi. All rights reserved.
//

#import "HttpJsonRequster.h"
#import "DataReciever.h"

@interface HttpJsonRequster()

@property NSData* data;

@end

@implementation HttpJsonRequster

-(void)postRequest:(NSString*)fullUrl
     headers:(NSDictionary*)headers
        data:(NSData*)data
  withTarget:(id<DataReciever>)target{
    NSMutableURLRequest *request = [self baseRequest:fullUrl headers:headers data:data andType:@"POST"];
    [self sendRequest:request target:target andType:@"POST"];
}

-(void)getRequest:(NSString*)fullUrl
     headers:(NSDictionary*)headers
  withTarget:(id<DataReciever>)target{
    NSMutableURLRequest *request = [self baseRequest:fullUrl headers:headers data:nil andType:@"GET"];
    [self sendRequest:request target:target andType:@"GET"];
}


-(void)putRequest:(NSString *)fullUrl headers:(NSDictionary *)headers data:(NSData *)data withTarget:(id<DataReciever>)target{
    NSMutableURLRequest *request = [self baseRequest:fullUrl headers:headers data:data andType:@"PUT"];
    [self sendRequest:request target:target andType:@"PUT"];
}

-(void)deleteRequest:(NSString *)fullUrl headers:(NSDictionary *)headers withTarget:(id<DataReciever>)target{
    NSMutableURLRequest *request = [self baseRequest:fullUrl headers:headers data:nil andType:@"DELETE"];
    [self sendRequest:request target:target andType:@"DELETE"];
}

-(void)sendRequest:(NSMutableURLRequest*)request target:(id<DataReciever>)target andType:(NSString*)requestType{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               [target httpResponceRecieve:response data:data type:requestType error:connectionError];
                           }];
}

-(NSMutableURLRequest*)baseRequest:(NSString *)fullUrl headers:(NSDictionary *)headers data:(NSData *)data andType:(NSString*)requestType{
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:fullUrl]];
    
    [request setHTTPMethod:requestType];
    for (NSString* key in headers) {
        NSString* value = [headers objectForKey:key];
        [request setValue:value forHTTPHeaderField:key];
    }
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    if (data != nil) {
        [request setHTTPBody:data];
    }
    
    return request;
}

@end
