//
//  HotelSearchAPI.m
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "HotelSearchAPI.h"
#import "APICommunicator.h"
#import "APIConstant.h"
@interface HotelSearchAPI(){
   NSURLSessionDataTask *task;
}
@end
@implementation HotelSearchAPI
#define searchAPI @"autocomplete?term="

#pragma mark - AutoComplete
/**
 * For Autocomplete on hotel location search
 */
- (void)callSearchAPIWithString:(NSString*)strSearch andResponse:(void (^)(NSArray *response,NSError *error))responseBlock {
    NSString *strParams = [NSString stringWithFormat:@"%@%@",searchAPI,strSearch];
    NSString *strURL = [NSString stringWithFormat:@"%@%@",baseURL,strParams];

    if (task) {
        [task cancel];
    }
    task = [APICommunicator callGetMethodWithParams:strURL andResponse:^(id data,NSError *error) {
        if (!error) {
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *arrCities = [self parseSearchLocationWithResponse:jsonResponse];
            responseBlock(arrCities,error);
        }
        else{
            responseBlock(nil,error);
        }
    }];
}
/**
 * Parsing the response of autocomplete
 */
- (NSArray*)parseSearchLocationWithResponse:(id)response{
    NSLog(@"%@",response);
    NSDictionary *dictCities = response;
    NSArray *arrCities = [dictCities objectForKey:@"cities"];
    return arrCities;
}

#pragma mark - Hotel Listing
+ (void)callHoteListAPIWithRequest:(HotelSearchRequestData*)objHotelSearch andResponse:(void (^)(NSArray *response,Paging *objPagination,NSError *error))responseBlock {
    NSString *strParams = @"http://hsp-search.int.travelpass.com/api/v1/hotels/rate_search?arrival=&country=US&currency=USD&departure=&language=en-US&page_size=10&postal_code=&rooms=rooms%5B%5D%5Badults%5D%3D1&tracker=7c1b6ce8-6c2d-11e6-a6c5-021e9d5a8a13";
    
    strParams = [NSString stringWithFormat:@"%@&city=%@&state_province=%@&page=%@",strParams,[objHotelSearch.strCity stringByReplacingOccurrencesOfString:@" " withString:@""],[objHotelSearch.strStateProvince stringByReplacingOccurrencesOfString:@" " withString:@""],objHotelSearch.strPage];
    [APICommunicator callGetMethodWithParams:strParams andResponse:^(id data,NSError *error) {
        if (!error) {
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *arrHotels = [self parseHotelListingWithResponse:jsonResponse];
            Paging *objPage = [self parseHotelListingPagination:jsonResponse];
            responseBlock(arrHotels,objPage,error);
        }
        else{
            responseBlock(nil,nil,error);
        }
    }];
}
+ (Paging*)parseHotelListingPagination:(id)response {
    Paging *objPage = [[Paging alloc]init];
    // pagination
    NSDictionary *dictResponse = response;
    if (![[dictResponse objectForKey:@"custom"] isKindOfClass:[NSNull class]]) {
        NSDictionary *dictCustom = [dictResponse objectForKey:@"custom"];
        objPage.currentPage = [[dictCustom objectForKey:@"next_page"] intValue];
        objPage.totalPage = [[dictCustom objectForKey:@"total_pages"] intValue];
    }
    return objPage;
}

+ (NSArray*)parseHotelListingWithResponse:(id)response {
    NSDictionary *dictResponse = response;
    // hotels listing
    if (![[dictResponse objectForKey:@"resource"] isKindOfClass:[NSNull class]]) {
        NSDictionary *dictResource = [dictResponse objectForKey:@"resource"];
        if (![[dictResource objectForKey:@"value"] isKindOfClass:[NSNull class]]) {
            NSDictionary *dictValue = [dictResource objectForKey:@"value"];
            if (![[dictValue objectForKey:@"hotels"] isKindOfClass:[NSNull class]]) {
               NSArray *arrHotels = [dictValue objectForKey:@"hotels"];
                NSMutableArray *arrHotelObjects = [[NSMutableArray alloc]init];
                for (NSDictionary *dictHotelValue in arrHotels) {
                    NSDictionary *dictResults = [dictHotelValue objectForKey:@"value"];
                    HotelSearchResult *objHotel = [[HotelSearchResult alloc]init];
                    objHotel.strAddress = [dictResults objectForKey:@"address"];
                    objHotel.strArrival = [dictResults objectForKey:@"check_in_time"];
                    objHotel.strCity = [dictResults objectForKey:@"city"];
                    objHotel.strCountry = [dictResults objectForKey:@"country"];
                    objHotel.strDaparture = [dictResults objectForKey:@"check_out_time"];
                    objHotel.strLatitude = [dictResults objectForKey:@"latitude"];
                    objHotel.strLongitude = [dictResults objectForKey:@"longitude"];
                    objHotel.strName = [dictResults objectForKey:@"name"];
                   // objHotel.strPage = [dictResults objectForKey:@""];
                   // objHotel.strPageSize = [dictResults objectForKey:@""];
                    objHotel.strPostalCode = [dictResults objectForKey:@"postal_code"];
                   // objHotel.strRooms = [dictResults objectForKey:@""];
                    objHotel.strStateProvince = [dictResults objectForKey:@"state_province"];
                    objHotel.arrImages = [dictResults objectForKey:@"images"];
                    objHotel.strStandardPrice = [dictResults objectForKey:@"standard_rate"];
                    objHotel.strAvgPrice = [dictResults objectForKey:@"average_rate"];
                    objHotel.strRating = [dictResults objectForKey:@"star_rating"];
                    [arrHotelObjects addObject:objHotel];
                    
                }
                return arrHotelObjects;
            }
        }
    }
    return nil;
}
@end
