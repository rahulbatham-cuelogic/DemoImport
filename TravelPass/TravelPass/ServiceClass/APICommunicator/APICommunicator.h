//
//  APICommunicator.h
//  TravelPass
//
//  Created by Harshit Dongre on 23/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APICommunicator : NSObject
+ (NSURLSessionDataTask*)callGetMethodWithParams:(NSString *)strParams andResponse:(void (^)(id response, NSError *error))responseBlock ;
@end
