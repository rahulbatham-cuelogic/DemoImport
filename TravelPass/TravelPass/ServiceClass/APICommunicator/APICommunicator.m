//
//  APICommunicator.m
//  TravelPass
//
//  Created by Harshit Dongre on 23/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "APICommunicator.h"
#import "ReachabilityCheck.h"
#import "BaseAPI.h"

@interface APICommunicator()
@property (nonatomic) ReachabilityCheck *internetReachability;
@end

@implementation APICommunicator

+ (NSURLSessionDataTask*)callGetMethodWithParams:(NSString *)strParams andResponse:(void (^)(id response, NSError *error))responseBlock {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:strParams];
    NSMutableURLRequest *request = [BaseAPI createAPIRequestWithMethod:@"GET" andURL:url];
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            responseBlock(data,error);
    }];
    [postDataTask resume];
    return postDataTask;
}
- (void)checkInternet {
    self.internetReachability = [ReachabilityCheck reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
}
- (void)updateInterfaceWithReachability:(ReachabilityCheck *)reachability {
    if (reachability == self.internetReachability)
    {
        [self configurereachability:reachability];
    }
    
}
- (void)configurereachability:(ReachabilityCheck *)reachability {
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            /*
             Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
             */
            connectionRequired = NO;
            break;
        }
            
        case ReachableViaWWAN:        {
            statusString = NSLocalizedString(@"Reachable WWAN", @"");
            break;
        }
        case ReachableViaWiFi:        {
            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            break;
        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
}

@end
