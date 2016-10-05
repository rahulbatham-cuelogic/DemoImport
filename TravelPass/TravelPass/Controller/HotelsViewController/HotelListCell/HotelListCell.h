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
@property(nonatomic,weak)IBOutlet UILabel *hotelName;
@property(nonatomic,weak)IBOutlet UILabel *hotelStandardPrice;
@property(nonatomic,weak)IBOutlet UILabel *hotelOfferedPrice;
@property(nonatomic,weak)IBOutlet UIImageView *hotelBackgroundImage;
@property(nonatomic,weak)IBOutlet HCSStarRatingView *starRatingView;
@end
