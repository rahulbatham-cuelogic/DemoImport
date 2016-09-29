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

@interface SideMenuController ()
{
    IBOutlet UITableView *tblVMenuList;/**< shows the list of the side menu*/
    NSArray *arrMenus; /**< holds the menus data */
}
@end

@implementation SideMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    [tblVMenuList reloadData];
    arrMenus = [SideMenuConfiguration configureSideMenuItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Instance Methods
-(void)setMenuViewControllerFromListObject:(SideMenuModel*)objMenu{
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    UIViewController *controller;
    switch (objMenu.enmMenus) {
        case HOTEL:
        {
            controller = K_INTANTIATE_HOTELSTORYBOARD(K_STORYBOARD_HOTELCONTROLLER);
        }
            break;
        case ITINERARY:
        {
            controller = K_INTANTIATE_ITINARARYSTORYBOARD(K_STORYBOARD_ITINARARYCONTROLLER);
        }
            break;
        case FAVORITES:
        {
            controller = K_INTANTIATE_FAVOURITESTORYBOARD(K_STORYBOARD_FAVOURITESCONTROLLER);
        }
            break;
        case MESSAGES:
        {
            controller = K_INTANTIATE_MESSAGESTORYBOARD(K_STORYBOARD_MESSAGECONTROLLER);
        }
            break;
        case CONTACTSUPPORT:
        {
            return;
        }
            break;
        case PROFILE:
        {
            controller = K_INTANTIATE_PROFILESTORYBOARD(K_STORYBOARD_PROFILECONTROLLER);
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
    [cell.imgMenuIcons setImage:[UIImage imageNamed:objMenu.strIconName]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   SideMenuModel *sideMenu = [arrMenus objectAtIndex:indexPath.row];
    [self setMenuViewControllerFromListObject:sideMenu];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
