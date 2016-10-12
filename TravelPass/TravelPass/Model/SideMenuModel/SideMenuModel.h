//
//  SideMenuModel.h
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum menus{
    HOTEL_ENM,
    ITINERARY,
    FAVORITES,
    MESSAGES,
    PROFILE_ENM,
    CONTACTSUPPORT_ENM
}menus;
@interface SideMenuModel : NSObject
@property(nonatomic,strong)NSString *strTitle;
@property(nonatomic,strong)NSString *strIconName;
@property(nonatomic,assign)BOOL isHide;
@property(nonatomic,assign)menus enmMenus;

- (id)initWithTitle:(NSString *)strTitle andIconName:(NSString *)strIconName andMenus:(menus)enmMenus andIsHide:(BOOL)isHide;
@end
