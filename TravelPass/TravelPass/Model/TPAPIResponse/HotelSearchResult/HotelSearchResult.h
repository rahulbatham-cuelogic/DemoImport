//
//  HotelSearchResult.h
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelSearchResult : NSObject
@property(nonatomic,strong)NSString *strAddress;
@property(nonatomic,strong)NSString *strArrival;
@property(nonatomic,strong)NSString *strCity;
@property(nonatomic,strong)NSString *strCountry;
@property(nonatomic,strong)NSString *strDaparture;
@property(nonatomic,strong)NSString *strLatitude;
@property(nonatomic,strong)NSString *strLongitude;
@property(nonatomic,strong)NSString *strName;
@property(nonatomic,strong)NSString *strPage;
@property(nonatomic,strong)NSString *strPageSize;
@property(nonatomic,strong)NSString *strPostalCode;
@property(nonatomic,strong)NSString *strRooms;
@property(nonatomic,strong)NSString *strStateProvince;
@property(nonatomic,strong)NSString *strStandardPrice;
@property(nonatomic,strong)NSString *strAvgPrice;
@property(nonatomic,strong)NSString *strRating;
@property(nonatomic,strong)NSArray *arrImages;
@end
