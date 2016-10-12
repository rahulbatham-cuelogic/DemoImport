//
//  SideMenuModel.m
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "SideMenuModel.h"

@implementation SideMenuModel

- (id)initWithTitle:(NSString *)strTitle andIconName:(NSString *)strIconName andMenus:(enum menus)enmMenus andIsHide:(BOOL)isHide {
    self = [super init];
    if (self) {
        _strTitle = strTitle;
        _strIconName = strIconName;
        _isHide = isHide;
        _enmMenus = enmMenus;
    }
    return self;
}
@end
