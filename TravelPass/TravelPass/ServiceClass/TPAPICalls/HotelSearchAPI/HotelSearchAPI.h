//
//  HotelSearchAPI.h
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotelSearchResult.h"
#import "HotelSearchRequestData.h"
#import "Paging.h"

@interface HotelSearchAPI : NSObject
- (void)callSearchAPIWithString:(NSString*)strSearch andResponse:(void (^)(NSArray *response,NSError *error))responseBlock ;
+ (void)callHoteListAPIWithRequest:(HotelSearchRequestData*)objHotelSearch andResponse:(void (^)(NSArray *response,Paging *objPagination,NSError *error))responseBlock ;
@end
