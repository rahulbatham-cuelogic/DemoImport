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
#import "Utility.h"

@interface HotelsViewController ()<HotelSearchDelegate>
{
    __weak IBOutlet UIView *headerV;
    __weak IBOutlet UITableView *tblVHotelListing;
    __weak IBOutlet UIView *containerView;
    NSMutableArray *arrHotelsList;
    NSString *strSearchedLocation;
    __weak IBOutlet UILabel *lblEmptyListMessage;
    __weak IBOutlet UILabel *startDate;
    __weak IBOutlet UILabel *endDate;
    int currentPage;
    int pageSize;
    int totalPage;
}
@end

@implementation HotelsViewController
#define tblVHeight 145.0
#define loadMoreViewHeight 40.0
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitialValues];
    [self showHotelList];
    [self setupMenuBarButtonItems];
    [self setDefaultDates];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setHeaderView];
}

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (arrHotelsList.count>0) {
        [UserDefaults setIsHotelListAvailable:YES];
        [UserDefaults setHotelLocationSearch:strSearchedLocation];
    }else {
        [UserDefaults setIsHotelListAvailable:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Methods
- (void)setInitialValues {
    currentPage = 1;
    pageSize = 10;
    totalPage = 1;
    strSearchedLocation = @"";
    arrHotelsList = [[NSMutableArray alloc]init];
    HotelSearchViewController *objHotelSearch = self.childViewControllers.lastObject;
    objHotelSearch.delegate = self;
}

- (HotelSearchRequestData*)createHotelSearchRequestObject {
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
    objRequest.strPage = [NSString stringWithFormat:@"%d",currentPage];
    return objRequest;
}

- (void)showHotelList {
    if ([UserDefaults getIsHotelListAvailable]) {
        [self showContainerView:NO];
        if ([UserDefaults getHotelLocationSearch]) {
            strSearchedLocation = [UserDefaults getHotelLocationSearch];
            [self getHotelListingWithHUD:YES];
        }
    }
}

- (void)setHeaderView {
    headerV.layer.borderWidth = 1.0;
    headerV.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1].CGColor;
    
    NSString *text = [NSString stringWithFormat:@"%@\n%@",HOTEL_TITLE,strSearchedLocation];
    // Define general attributes for the entire text
    NSDictionary *attribs = @{
                              NSForegroundColorAttributeName:[UIColor redColor],
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:16]
                              };
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text attributes:attribs];
    UIFont *boldFont = [UIFont fontWithName:@"Helvetica" size:12.0];
    NSRange range = [text rangeOfString:strSearchedLocation];
    [attributedText setAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                    NSFontAttributeName:boldFont} range:range];
    [self setNavigationHeaderTitleAttributedString:attributedText];

}

- (void)showContainerView:(BOOL)isShowContainerView{
    tblVHotelListing.hidden = isShowContainerView;
    containerView.hidden = !isShowContainerView;
}

- (void)setDefaultDates{
   startDate.text = [Utility getdateString:[NSDate date]];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
    endDate.text = [Utility getdateString:nextDate];
}

#pragma mark - Actions
- (IBAction)edit:(id)sender {
    [self showContainerView:YES];
}

#pragma mark - API Call
- (void)getHotelListingWithHUD:(BOOL)isShowHUD{
    HotelSearchRequestData *objRequest = [self createHotelSearchRequestObject];
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
                [self setHeaderView];
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [arrHotelsList removeAllObjects];
                [tblVHotelListing reloadData];
                [Messages alertViewWithMessage:error.localizedDescription OnViewController:self];
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
- (void)hotelSearchLocationDidSelect:(NSString *)strLocation {
    strSearchedLocation = strLocation;
}

- (void)hotelSearchDidUpdate:(id)sender {
    currentPage = 1;
    [arrHotelsList removeAllObjects];
    [self showContainerView:NO];
    [self getHotelListingWithHUD:YES];
}

- (void)hotelSearchDidCancel:(id)sender {
    [self showContainerView:NO];
    if (arrHotelsList.count == 0) {
        lblEmptyListMessage.hidden = NO;
    }
    else {
        lblEmptyListMessage.hidden = YES;
    }
}

#pragma mark - Cell configurations
- (void)configureHotelListView:(HotelListCell*)cell withIndexPath:(NSIndexPath*)indexPath {
    HotelSearchResult *objHotel = [arrHotelsList objectAtIndex:indexPath.row];
    NSString *strImageURL = @"";
    if (objHotel.arrImages.count>0) {
        strImageURL = [objHotel.arrImages objectAtIndex:0];
        strImageURL = [NSString stringWithFormat:@"http:%@",strImageURL];
        strImageURL = [strImageURL stringByReplacingOccurrencesOfString:@":size" withString: [NSString stringWithFormat:@"%dx140",(int)tblVHotelListing.frame.size.width]];
    }
    [cell.imgVhotelBackground sd_setImageWithURL:[NSURL URLWithString:strImageURL]
                                placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    if (objHotel.strStandardPrice) {
        NSAttributedString * title =
        [[NSAttributedString alloc] initWithString:[objHotel.strStandardPrice stringByReplacingOccurrencesOfString:@"USD" withString:@""]
                                        attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
        [cell.lblHotelStandardPrice setAttributedText:title];
    }
    cell.lblHotelOfferedPrice.text = [objHotel.strAvgPrice stringByReplacingOccurrencesOfString:@"USD" withString:@""];
    cell.lblHotelName.text = objHotel.strName;
    cell.hcsStarRatingView.value = [objHotel.strRating floatValue];
}

#pragma mark - tableview delegates and datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < arrHotelsList.count) {
        return tblVHeight;
    }
    else{
        return loadMoreViewHeight;
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
        [self configureHotelListView:cell withIndexPath:indexPath];
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
