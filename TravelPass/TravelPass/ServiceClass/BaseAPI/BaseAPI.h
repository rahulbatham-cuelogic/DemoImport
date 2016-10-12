//
//  BaseAPI.h
//  TravelPass
//
//  Created by Harshit Dongre on 23/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseAPI : NSObject
+ (NSMutableURLRequest*)createAPIRequestWithMethod:(NSString *)strMethodType andURL:(NSURL*)url;
@end
