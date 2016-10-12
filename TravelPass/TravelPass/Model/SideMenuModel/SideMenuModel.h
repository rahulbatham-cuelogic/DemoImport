//
//  SideMenuModel.h
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>
enum menus{
    HOTEL_ENM,
    ITINERARY,
    FAVORITES,
    MESSAGES,
    PROFILE_ENM,
    CONTACTSUPPORT_ENM
};
@interface SideMenuModel : NSObject
@property(nonatomic,strong)NSString *strTitle;
@property(nonatomic,strong)NSString *strIconName;
@property(nonatomic,assign)BOOL isHide;
@property(nonatomic,assign)enum menus enmMenus;

- (id)initWithTitle:(NSString *)strTitle andIconName:(NSString *)strIconName andMenus:(enum menus)enmMenus andIsHide:(BOOL)isHide;
@end
