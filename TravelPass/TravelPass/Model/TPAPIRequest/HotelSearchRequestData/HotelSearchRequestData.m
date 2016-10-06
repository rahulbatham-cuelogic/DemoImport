//
//  HotelSearchRequestData.m
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "HotelSearchRequestData.h"

@implementation HotelSearchRequestData
- (id)initWithDefaultValues {
    self = [super init];
    _strArrival = @"2016-11-02";//
    _strCountry = @"US";//
    _strCurrency = @"USD";//
    _strDaparture = @"2016-11-03";//
    _strLanguage = @"en-US";//
    _strPageSize = @"10";//
    _strPostalCode = @"21638";//
    _strRooms = @"rooms%5B%5D%5Badults%5D%3D1";//
    _strTracker = @"7c1b6ce8-6c2d-11e6-a6c5-021e9d5a8a13";//
    return self;
}
@end
