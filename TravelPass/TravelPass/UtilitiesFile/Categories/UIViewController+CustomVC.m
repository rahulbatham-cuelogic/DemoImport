//
//  UIViewController+CustomVC.m
//  TravelPass
//
//  Created by Harshit Dongre on 26/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "UIViewController+CustomVC.h"
#import "MFSideMenu.h"

@implementation UIViewController (CustomVC)
#pragma mark -
#pragma mark - UIBarButtonItems

- (void)setupMenuBarButtonItems {
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
       ![[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    } else {
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
}
-(void)setNavigationHeaderTitle:(NSString *)strTitle{
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    lbl.textColor = [UIColor redColor];
    lbl.text = strTitle;
    lbl.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = lbl;
}
- (UIBarButtonItem *)leftMenuBarButtonItem {
    return [[UIBarButtonItem alloc]
            initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain
            target:self
            action:@selector(leftSideMenuButtonPressed:)];
}
- (UIBarButtonItem *)backBarButtonItem {
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow"]
                                            style:UIBarButtonItemStylePlain
                                           target:self
                                           action:@selector(backButtonPressed:)];
}
#pragma mark -
#pragma mark - UIBarButtonItem Callbacks

- (void)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        [self setupMenuBarButtonItems];
    }];
}


@end
