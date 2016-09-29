//
//  UserDefaults.h
//  TravelPass
//
//  Created by Harshit Dongre on 28/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject
+(BOOL)isLoggedIn;/**< will return value wheather logged in or not */
+(void)setLoggedIn:(BOOL)isLogin; /**< sets login value as 1 for login and 0 for not logged in */
@end
