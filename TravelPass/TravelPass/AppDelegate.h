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
@property(nonatomic,assign)BOOL isLoggedIn; /**< return YES if user logged in else retur NO*/
-(void)setSideMenuViewAsRootViewContoller; /**< Will set side menu as root view controller*/
- (void)showProgressHUDInView:(UIView*)containerV; /**< show progress indicator */
- (void)hideProgresshHUDInView:(UIView*)containerV; /**< hide progress indicator */
@end

