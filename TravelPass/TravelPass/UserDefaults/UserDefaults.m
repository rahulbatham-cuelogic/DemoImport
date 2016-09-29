//
//  UserDefaults.m
//  TravelPass
//
//  Created by Harshit Dongre on 28/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "UserDefaults.h"

@implementation UserDefaults
/**
 * will return value wheather logged in or not 
 */
+(BOOL)isLoggedIn{
    NSUInteger value = [[[NSUserDefaults standardUserDefaults] objectForKey:K_USERDEFAULT_ISLOGGEDIN] integerValue];
    if (value) {
        return YES;
    }
    else{
        return NO;
    }
}
/**
 * sets login value as 1 for login and 0 for not logged in 
 */
+(void)setLoggedIn:(BOOL)isLogin{
    if (isLogin) {
        [[NSUserDefaults standardUserDefaults] setObject:@1 forKey:K_USERDEFAULT_ISLOGGEDIN];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:K_USERDEFAULT_ISLOGGEDIN];
    }
}
@end
