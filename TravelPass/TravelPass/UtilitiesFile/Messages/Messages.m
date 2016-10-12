//
//  Messages.m
//  TravelPass
//
//  Created by Harshit Dongre on 05/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "Messages.h"
#import "Alert.h"

@implementation Messages

+ (void)alertViewWithMessage:(NSString *)strMsg OnViewController:(UIViewController*)controller {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:ALERT message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [controller presentViewController:alertController animated:YES completion:nil];
}

@end
