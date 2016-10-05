//
//  BaseAPI.m
//  TravelPass
//
//  Created by Harshit Dongre on 23/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "BaseAPI.h"

@implementation BaseAPI
#define token @"Token token='215bd55adeeb15dcffc14fe7a77c5d7f'"
+ (NSMutableURLRequest*)createAPIRequestWithMethod:(NSString *)strMethodType andURL:(NSURL*)url {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    //[request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
   // [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:token forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:@"GET"];
    return request;
}
@end
