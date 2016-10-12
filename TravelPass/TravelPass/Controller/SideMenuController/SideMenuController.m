//
//  SideMenuController.m
//  TravelPass
//
//  Created by Harshit Dongre on 23/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "SideMenuController.h"
#import "SideMenuConfiguration.h"
#import "SideMenuModel.h"
#import "MenuCell.h"
#import "MFSideMenu.h"
#import "Utility.h"

@interface SideMenuController ()
{
    IBOutlet UITableView *tblViewMenuList;
    NSArray *arrMenus; 
}
@end

#define defaultSelectedIndex 1

@implementation SideMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [tblViewMenuList reloadData];
    arrMenus = [SideMenuConfiguration configureSideMenuItems];
    SideMenuModel *sideMenu = [arrMenus objectAtIndex:defaultSelectedIndex];
    [self setMenuViewControllerFromListObject:sideMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Instance Methods
- (void)setMenuViewControllerFromListObject:(SideMenuModel*)objMenu {
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    UIViewController *controller;
    switch (objMenu.enmMenus) {
        case HOTEL_ENM:
        {
            controller = INTANTIATE_HOTELSTORYBOARD(STORYBOARD_HOTELCONTROLLER);
        }
            break;
        case ITINERARY:
        {
            controller = INTANTIATE_ITINARARYSTORYBOARD(STORYBOARD_ITINARARYCONTROLLER);
        }
            break;
        case FAVORITES:
        {
            controller = INTANTIATE_FAVOURITESTORYBOARD(STORYBOARD_FAVOURITESCONTROLLER);
        }
            break;
        case MESSAGES:
        {
            controller = INTANTIATE_MESSAGESTORYBOARD(STORYBOARD_MESSAGECONTROLLER);
        }
            break;
        case CONTACTSUPPORT_ENM:
        {
            return;
        }
            break;
        case PROFILE_ENM:
        {
            controller = INTANTIATE_PROFILESTORYBOARD(STORYBOARD_PROFILECONTROLLER);
        }
            break;
        default:
            break;
    }
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    NSArray *controllers = [NSArray arrayWithObject:controller];
    navigationController.viewControllers = controllers;

}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrMenus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCellID" forIndexPath:indexPath];
    SideMenuModel *objMenu = [arrMenus objectAtIndex:indexPath.row];
    cell.lblMenuTitles.text = objMenu.strTitle;
    cell.lblMenuTitles.font = [cell.lblMenuTitles.font fontWithSize:cell.lblMenuTitles.font.pointSize*fontScale];
    [cell.imgViewMenuIcons setImage:[UIImage imageNamed:objMenu.strIconName]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   SideMenuModel *sideMenu = [arrMenus objectAtIndex:indexPath.row];
    [self setMenuViewControllerFromListObject:sideMenu];
}
@end
