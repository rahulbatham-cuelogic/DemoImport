//
//  Messages.h
//  TravelPass
//
//  Created by Harshit Dongre on 05/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Messages : NSObject
+ (void)alertViewWithMessage:(NSString *)strMsg OnViewController:(UIViewController*)controller;
@end
