//
//  HotelsViewController.m
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "HotelsViewController.h"
#import "UIViewController+CustomVC.h"
#import "HotelSearchViewController.h"
#import "HotelListCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "HotelSearchRequestData.h"
#import "HotelSearchAPI.h"
#import "Constant.h"
#import "AppDelegate.h"
#import "UserDefaults.h"
#import "Messages.h"
@interface HotelsViewController ()<hotelSearchDelegate>
{
    __weak IBOutlet UIView *headerV;
    __weak IBOutlet UITableView *tblVHotelListing; /**< tableview to show the hotels list*/
    NSUInteger intHtTableV; /**< tableview intial height */
    
    __weak IBOutlet NSLayoutConstraint *yContainerV;
    __weak IBOutlet UIView *containerV;
    NSMutableArray *arrHotelsList;
    NSString *strSearchedLocation;
    __weak IBOutlet UILabel *lblEmptyListMessage; /**< shows the message in case of empty screen */
    int currentPage;
    int pageSize;
    int totalPage;
}
@end

@implementation HotelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentPage = 1;
    pageSize = 10;
    totalPage = 1;
    strSearchedLocation = @"";
    arrHotelsList = [[NSMutableArray alloc]init];
    if ([UserDefaults getIsHotelListAvailable]) {
        [self showContainerView:NO];
        if ([UserDefaults getHotelLocationSearch]) {
            strSearchedLocation = [UserDefaults getHotelLocationSearch];
            [self getHotelListingWithHUD:YES];
        }
    }
    HotelSearchViewController *objHotelSearch = self.childViewControllers.lastObject;
    objHotelSearch.delegate = self;
    [self setupMenuBarButtonItems]; // will show the left menu bar button to open the side menu
    [self setNavigationHeaderTitle:HOTEL_TITLE];
    headerV.layer.borderWidth = 1.0;
    headerV.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1].CGColor;
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (arrHotelsList.count>0) {
        [UserDefaults setIsHotelListAvailable:YES];
        [UserDefaults setHotelLocationSearch:strSearchedLocation];
    }
    else {
        [UserDefaults setIsHotelListAvailable:NO];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Instance Methods
- (void)showContainerView:(BOOL)isShowContainerView{
    tblVHotelListing.hidden = isShowContainerView;
    containerV.hidden = !isShowContainerView;
}
#pragma mark - Actions
- (IBAction)edit:(id)sender {
    [self showContainerView:YES];
}
#pragma mark - API Call
- (void)getHotelListingWithHUD:(BOOL)isShowHUD{
    HotelSearchRequestData *objRequest = [[HotelSearchRequestData alloc]initWithDefaultValues];
   
    NSArray *arrCity_State = [strSearchedLocation componentsSeparatedByString:@","];
    if (arrCity_State.count>0) {
        NSString *strCity = [arrCity_State objectAtIndex:0];
        objRequest.strCity = strCity;
        if (arrCity_State.count>1) {
            NSString *strState = [arrCity_State objectAtIndex:1];
            objRequest.strStateProvince = strState;
        }
    }
    objRequest.strPage = [NSString stringWithFormat:@"%d",currentPage]; //
    
    if (isShowHUD) {
        [APPDELEGATE showProgressHUDInView:self.view];
    }
    lblEmptyListMessage.hidden = YES;
    // API call
    [HotelSearchAPI callHoteListAPIWithRequest:objRequest andResponse:^(NSArray *response,Paging *objPage,NSError *error) {
        if (!error) {
            [arrHotelsList addObjectsFromArray:response];
            if (objPage) {
                currentPage = objPage.currentPage;
                totalPage = objPage.totalPage;
            }
            if (arrHotelsList.count == 0) {
                lblEmptyListMessage.hidden = NO;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [tblVHotelListing reloadData];
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [arrHotelsList removeAllObjects];
                [tblVHotelListing reloadData];
                [Messages showMessage:error.localizedDescription OnViewController:self];
            });
        }
        if (isShowHUD) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [APPDELEGATE hideProgresshHUDInView:self.view];
            });
        }
    }];
}
#pragma mark - hotel search delegates
- (void)selectedLocation:(NSString *)strLocation{
    strSearchedLocation = strLocation;
}
- (void)updatePressed:(id)sender{
    currentPage = 1;
    [arrHotelsList removeAllObjects];
    [self showContainerView:NO];
    [self getHotelListingWithHUD:YES];
}
- (void)cancelPressed:(id)sender{
    [self showContainerView:NO];
    if (arrHotelsList.count == 0) {
        lblEmptyListMessage.hidden = NO;
    }
    else {
        lblEmptyListMessage.hidden = YES;
    }
}
#pragma mark - tableview delegates and datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < arrHotelsList.count) {
        return 145.0;
    }
    else{
        return 40.0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (currentPage == totalPage) {
        return arrHotelsList.count;
    }
    else{
        return arrHotelsList.count+1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < arrHotelsList.count) {
        HotelListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelListCellID"];
        HotelSearchResult *objHotel = [arrHotelsList objectAtIndex:indexPath.row];
        NSString *strImageURL = @"";
        if (objHotel.arrImages.count>0) {
            strImageURL = [objHotel.arrImages objectAtIndex:0];
            strImageURL = [NSString stringWithFormat:@"http:%@",strImageURL];
            strImageURL = [strImageURL stringByReplacingOccurrencesOfString:@":size" withString: [NSString stringWithFormat:@"%dx140",(int)tblVHotelListing.frame.size.width]];
        }
        [cell.hotelBackgroundImage sd_setImageWithURL:[NSURL URLWithString:strImageURL]
                                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        if (objHotel.strStandardPrice) {
            NSAttributedString * title =
            [[NSAttributedString alloc] initWithString:[objHotel.strStandardPrice stringByReplacingOccurrencesOfString:@"USD" withString:@""]
                                            attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
            [cell.hotelStandardPrice setAttributedText:title];
        }
        cell.hotelOfferedPrice.text = [objHotel.strAvgPrice stringByReplacingOccurrencesOfString:@"USD" withString:@""];
        cell.hotelName.text = objHotel.strName;
        cell.starRatingView.value = [objHotel.strRating floatValue];
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoadMoreCellID"];
        [self getHotelListingWithHUD:NO];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
@end
