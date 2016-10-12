//
//  UserDefaults.m
//  TravelPass
//
//  Created by Harshit Dongre on 28/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "UserDefaults.h"

@implementation UserDefaults

#pragma mark - LOGIN

+ (BOOL)isLoggedIn {
    return [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_ISLOGGEDIN];
}

+( void)setLoggedIn:(BOOL)isLogin {
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:USERDEFAULT_ISLOGGEDIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - HOTEL LIST SEARCH CRITERIAS
+ (void)setHotelLocationSearch:(NSString *)strLocation {
    [[NSUserDefaults standardUserDefaults]setObject:strLocation forKey:USERDEFAULT_LOCATIONCRITERIA];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString*)getHotelLocationSearch {
    return [[NSUserDefaults standardUserDefaults] objectForKey:USERDEFAULT_LOCATIONCRITERIA];
    ;
}

+ (void)setIsHotelListAvailable:(BOOL)isList {
    [[NSUserDefaults standardUserDefaults]setBool:isList forKey:USERDEFAULT_ISHOTELLISTLOADED];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getIsHotelListAvailable {
    return [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_ISHOTELLISTLOADED];
    ;
}
@end
