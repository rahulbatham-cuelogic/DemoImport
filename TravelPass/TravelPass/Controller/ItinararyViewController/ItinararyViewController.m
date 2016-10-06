//
//  ItinararyViewController.m
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "ItinararyViewController.h"
#import "UIViewController+CustomVC.h"

@interface ItinararyViewController ()

@end

@implementation ItinararyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMenuBarButtonItems]; // will show the left menu bar button to open the side menu
    [self setNavigationHeaderTitle:ITINERARY_TITLE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
