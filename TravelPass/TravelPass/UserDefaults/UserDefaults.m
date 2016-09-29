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
+ (BOOL)isLoggedIn {
    return [[NSUserDefaults standardUserDefaults] boolForKey:USERDEFAULT_ISLOGGEDIN];
}
/**
 * sets login value as 1 for login and 0 for not logged in
 */
+( void)setLoggedIn:(BOOL)isLogin {
    if (isLogin) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:USERDEFAULT_ISLOGGEDIN];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:USERDEFAULT_ISLOGGEDIN];
    }
}
@end
