//
//  AppDelegate.h
//  TravelPass
//
//  Created by Harshit Dongre on 16/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,assign)BOOL isLoggedIn;
-(void)setSideMenuViewAsRootViewContoller;
- (void)showProgressHUDInView:(UIView*)containerV;
- (void)hideProgresshHUDInView:(UIView*)containerV;
@end

