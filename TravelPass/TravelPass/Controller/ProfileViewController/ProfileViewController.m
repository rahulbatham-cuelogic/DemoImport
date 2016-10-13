//
//  ProfileViewController.m
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIViewController+CustomVC.h"

@interface ProfileViewController ()
{
    __weak IBOutlet UITextView *txtViewUserProfile;
}
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMenuBarButtonItems]; 
    [self setNavigationHeaderTitle:PROFILE_TITLE];
    [self showUserProfile ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Instance method
- (void)showUserProfile {
    NSUserDefaults *lrUserProfile = [NSUserDefaults standardUserDefaults];
    txtViewUserProfile.text = [[lrUserProfile objectForKey:USERDEFAULT_USERPROFILE] description];
}
@end
