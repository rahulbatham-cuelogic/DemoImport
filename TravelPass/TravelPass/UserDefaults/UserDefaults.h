//
//  UserDefaults.h
//  TravelPass
//
//  Created by Harshit Dongre on 28/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject
+(BOOL)isLoggedIn;
+(void)setLoggedIn:(BOOL)isLogin;
+ (void)setHotelLocationSearch:(NSString *)strLocation;
+ (NSString*)getHotelLocationSearch;
+ (void)setIsHotelListAvailable:(BOOL)isList;
+ (BOOL)getIsHotelListAvailable;
@end
