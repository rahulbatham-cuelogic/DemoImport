//
//  SideMenuConfiguration.m
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "SideMenuConfiguration.h"

@implementation SideMenuConfiguration

+ (NSArray*)configureSideMenuItems {
    // hotel
    SideMenuModel *objHotel= [[SideMenuModel alloc]initWithTitle:HOTEL andIconName:HOTEL_ICON andMenus:HOTEL andIsHide:NO];
    SideMenuModel *objFavourites= [[SideMenuModel alloc]initWithTitle:FAVOURITES andIconName:FAVOURITES_ICON andMenus:FAVORITES andIsHide:NO];
    SideMenuModel *objMessage= [[SideMenuModel alloc]initWithTitle:MESSAGE andIconName:MESSAGE_ICON andMenus:MESSAGES andIsHide:NO];
    SideMenuModel *objProfile= [[SideMenuModel alloc]initWithTitle:PROFILE andIconName:PROFILE_ICON andMenus:PROFILE andIsHide:NO];
    SideMenuModel *objItinarary= [[SideMenuModel alloc]initWithTitle:ITINARARY andIconName:ITINARARY_ICON andMenus:ITINERARY andIsHide:NO];
    SideMenuModel *objContactSupport= [[SideMenuModel alloc]initWithTitle:CONTACTSUPPORT andIconName:CONTACTSUPPORT_ICON andMenus:CONTACTSUPPORT andIsHide:NO];
    NSArray *arrMenu = [[NSArray alloc]initWithObjects:objHotel,objItinarary,objFavourites,objMessage,objProfile,objContactSupport, nil];
    return arrMenu;
}

@end
