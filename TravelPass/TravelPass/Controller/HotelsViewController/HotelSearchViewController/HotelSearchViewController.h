//
//  HotelSearchViewController.h
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HotelSearchDelegate
- (void)hotelSearchLocationDidSelect:(NSString *)strLocation;
- (void)hotelSearchDidCancel:(id)sender;
- (void)hotelSearchDidUpdate:(id)sender;

@end
@interface HotelSearchViewController : UIViewController
@property(nonatomic,unsafe_unretained)id<HotelSearchDelegate> delegate; 
@end
