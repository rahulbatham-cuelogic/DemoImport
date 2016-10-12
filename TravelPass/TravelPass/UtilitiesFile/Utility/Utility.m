//
//  Utility.m
//  TravelPass
//
//  Created by Harshit Dongre on 23/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "Utility.h"
@implementation Utility
+(CGFloat) getFontScaleFactor
{
    #define baseScreenSize 4.5f;
    float scaleFactor = 1;
    float scale = [[UIScreen mainScreen] scale];
    
    float ppi = scale * ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 132 : 163);
    
    float width = ([[UIScreen mainScreen] bounds].size.width * scale);
    float height = ([[UIScreen mainScreen] bounds].size.height * scale);
    
    float horizontal = width / ppi, vertical = height / ppi;
    
    float diagonal = sqrt(pow(horizontal, 2) + pow(vertical, 2));
    if (diagonal > 4.0f) {
        scaleFactor = diagonal/ baseScreenSize;
    }
    //NSLog(@"Size : %f and scalefactor : %f",diagonal,scaleFactor);
    return scaleFactor;
}
+ (NSString*)getdateString:(NSDate*)date {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMMM dd, yyyy"];
    NSLog(@"My date with out format = %@",date);
    NSString *dateStr = [format stringFromDate:date];
    return dateStr;
}

@end
