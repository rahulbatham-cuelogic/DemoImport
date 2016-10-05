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
    SideMenuModel *objHotel= [[SideMenuModel alloc]initWithTitle:NSLocalizedString(HOTEL, nil) andIconName:HOTEL_ICON andMenus:HOTEL_ENM andIsHide:NO];
    SideMenuModel *objFavourites= [[SideMenuModel alloc]initWithTitle:NSLocalizedString(FAVOURITES, nil) andIconName:FAVOURITES_ICON andMenus:FAVORITES andIsHide:NO];
    SideMenuModel *objMessage= [[SideMenuModel alloc]initWithTitle:NSLocalizedString(MESSAGE, nil) andIconName:MESSAGE_ICON andMenus:MESSAGES andIsHide:NO];
    SideMenuModel *objProfile= [[SideMenuModel alloc]initWithTitle:NSLocalizedString(PROFILE, nil) andIconName:PROFILE_ICON andMenus:PROFILE_ENM andIsHide:NO];
    SideMenuModel *objItinarary= [[SideMenuModel alloc]initWithTitle:NSLocalizedString(ITINARARY, nil) andIconName:ITINARARY_ICON andMenus:ITINERARY andIsHide:NO];
    SideMenuModel *objContactSupport= [[SideMenuModel alloc]initWithTitle:NSLocalizedString(CONTACTSUPPORT, nil) andIconName:CONTACTSUPPORT_ICON andMenus:CONTACTSUPPORT_ENM andIsHide:NO];
    NSArray *arrMenu = [[NSArray alloc]initWithObjects:objHotel,objItinarary,objFavourites,objMessage,objProfile,objContactSupport, nil];
    return arrMenu;
}

@end
