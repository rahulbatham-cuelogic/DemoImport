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
@property(nonatomic,strong)NSString *strTitle; /**< will hold the title name on side menu*/
@property(nonatomic,strong)NSString *strIconName; /**< will hold the icon name on side menu */
@property(nonatomic,assign)BOOL isHide; /**< will decide if title should be visible or not on side menu */
@property(nonatomic,assign)enum menus enmMenus; /**< will decide if title should be visible or not on side menu */

- (id)initWithTitle:(NSString *)strTitle andIconName:(NSString *)strIconName andMenus:(enum menus)enmMenus andIsHide:(BOOL)isHide; /**< method used to intiate the object with variable values */
@end
