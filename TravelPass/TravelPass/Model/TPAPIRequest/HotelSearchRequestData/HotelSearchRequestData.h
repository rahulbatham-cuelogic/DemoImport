//
//  HotelSearchRequestData.h
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelSearchRequestData : NSObject

@property(nonatomic,strong)NSString *strArrival; //
@property(nonatomic,strong)NSString *strCity;
@property(nonatomic,strong)NSString *strCountry; //
@property(nonatomic,strong)NSString *strCurrency; //
@property(nonatomic,strong)NSString *strDaparture; //
@property(nonatomic,strong)NSString *strLanguage; //
@property(nonatomic,strong)NSString *strPage; //
@property(nonatomic,strong)NSString *strPageSize; //
@property(nonatomic,strong)NSString *strPostalCode; //
@property(nonatomic,strong)NSString *strRooms; //
@property(nonatomic,strong)NSString *strStateProvince; //
@property(nonatomic,strong)NSString *strTracker; //

- (id)initWithDefaultValues;

@end
