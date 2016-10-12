//
//  HotelListCell.h
//  TravelPass
//
//  Created by Harshit Dongre on 04/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCSStarRatingView.h"
@interface HotelListCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *lblHotelName;
@property(nonatomic,weak)IBOutlet UILabel *lblHotelStandardPrice;
@property(nonatomic,weak)IBOutlet UILabel *lblHotelOfferedPrice;
@property(nonatomic,weak)IBOutlet UIImageView *imgVhotelBackground;
@property(nonatomic,weak)IBOutlet HCSStarRatingView *hcsStarRatingView;
@end
