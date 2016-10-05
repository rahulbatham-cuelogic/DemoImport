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
/**
 * will return value wheather logged in or not
 */
+ (BOOL)isLoggedIn {
    return [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_ISLOGGEDIN];
}
/**
 * sets login value as 1 for login and 0 for not logged in
 */
+( void)setLoggedIn:(BOOL)isLogin {
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:USERDEFAULT_ISLOGGEDIN];
}

#pragma mark - HOTEL LIST SEARCH CRITERIAS
+ (void)setHotelLocationSearch:(NSString *)strLocation {
    [[NSUserDefaults standardUserDefaults]setObject:strLocation forKey:USERDEFAULT_LOCATIONCRITERIA];
}
+ (NSString*)getHotelLocationSearch {
    return [[NSUserDefaults standardUserDefaults] objectForKey:USERDEFAULT_LOCATIONCRITERIA];
    ;
}
/**
 * used to check if the list was there on hotel listing page
 */
+ (void)setIsHotelListAvailable:(BOOL)isList {
    [[NSUserDefaults standardUserDefaults]setBool:isList forKey:USERDEFAULT_ISHOTELLISTLOADED];
}
+ (BOOL)getIsHotelListAvailable {
    return [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_ISHOTELLISTLOADED];
    ;
}
@end
