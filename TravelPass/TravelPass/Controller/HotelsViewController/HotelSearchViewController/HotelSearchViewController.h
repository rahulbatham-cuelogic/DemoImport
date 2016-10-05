//
//  HotelSearchViewController.h
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol hotelSearchDelegate
- (void)selectedLocation:(NSString *)strLocation; /**< called when tap on any location on location list*/
- (void)cancelPressed:(id)sender; /**< cancel button pressed*/
- (void)updatePressed:(id)sender; /**< update button pressed*/

@end
@interface HotelSearchViewController : UIViewController
@property(nonatomic,unsafe_unretained)id<hotelSearchDelegate> delegate; /**< delegate instance */
@end
