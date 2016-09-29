//
//  SideMenuConfiguration.m
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "SideMenuConfiguration.h"

@implementation SideMenuConfiguration

+(NSArray*)configureSideMenuItems{
    // hotel
    SideMenuModel *objHotel= [[SideMenuModel alloc]initWithTitle:K_HOTEL andIconName:K_HOTEL_ICON andMenus:HOTEL andIsHide:NO];
    SideMenuModel *objFavourites= [[SideMenuModel alloc]initWithTitle:K_FAVOURITES andIconName:K_FAVOURITES_ICON andMenus:FAVORITES andIsHide:NO];
    SideMenuModel *objMessage= [[SideMenuModel alloc]initWithTitle:K_MESSAGE andIconName:K_MESSAGE_ICON andMenus:MESSAGES andIsHide:NO];
    SideMenuModel *objProfile= [[SideMenuModel alloc]initWithTitle:K_PROFILE andIconName:K_PROFILE_ICON andMenus:PROFILE andIsHide:NO];
    SideMenuModel *objItinarary= [[SideMenuModel alloc]initWithTitle:K_ITINARARY andIconName:K_ITINARARY_ICON andMenus:ITINERARY andIsHide:NO];
    SideMenuModel *objContactSupport= [[SideMenuModel alloc]initWithTitle:K_CONTACTSUPPORT andIconName:K_CONTACTSUPPORT_ICON andMenus:CONTACTSUPPORT andIsHide:NO];
    NSArray *arrMenu = [[NSArray alloc]initWithObjects:objHotel,objItinarary,objFavourites,objMessage,objProfile,objContactSupport, nil];
    return arrMenu;
}

@end
