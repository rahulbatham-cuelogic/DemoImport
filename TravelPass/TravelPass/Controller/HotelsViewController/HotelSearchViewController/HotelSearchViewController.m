//
//  HotelSearchViewController.m
//  TravelPass
//
//  Created by Harshit Dongre on 03/10/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "HotelSearchViewController.h"
#import "HotelSearchAPI.h"
#import "Messages.h"

@interface HotelSearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    
    __weak IBOutlet UIView *vwSearch;
    __weak IBOutlet UITableView *tblVLocationList;
    NSArray *arrLocations;
    HotelSearchAPI *objSearchAPI;
    __weak IBOutlet UIActivityIndicatorView *busyActivityView;
    __weak IBOutlet UITextField *txtFSearch;
    __weak IBOutlet UILabel *lblSearch;

}
@end

@implementation HotelSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrLocations = [[NSArray alloc]init];
    objSearchAPI = [[HotelSearchAPI alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Method

- (void)searchLocation:(NSString*)strLocation{
    //dispatch_async(dispatch_get_main_queue(), ^{
        busyActivityView.hidden = NO;
        [busyActivityView startAnimating];
   // });
    [objSearchAPI callSearchAPIWithString:strLocation andResponse:^(NSArray *response,NSError *error) {
        if (!error) {
            arrLocations = response;
            dispatch_async(dispatch_get_main_queue(), ^{
                [tblVLocationList reloadData];
            });
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [busyActivityView stopAnimating];
        });
    }];
}

- (void)showPlaceHolderWithString:(NSString *)strLocation andIsShowPlaceHolder:(BOOL)isShowPlaceHolder{
    tblVLocationList.hidden = isShowPlaceHolder;
    strLocation = [strLocation stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceCharacterSet]];

    if (isShowPlaceHolder) {
        txtFSearch.text = @"";
        lblSearch.text = strLocation;
        [txtFSearch resignFirstResponder];
    }else {
        txtFSearch.text = strLocation;
        lblSearch.text = @"";
    }
}

#pragma mark - Actions
- (IBAction)cancel:(id)sender {
    [_delegate hotelSearchDidCancel:sender];
}

- (IBAction)update:(id)sender {
    if (lblSearch.text.length>0) {
        [_delegate hotelSearchLocationDidSelect:lblSearch.text];
        [_delegate hotelSearchDidUpdate:sender];
    }else {
        [Messages alertViewWithMessage:NSLocalizedString(EMPTYHOTELLIST, @"Empty list.")  OnViewController:self];
    }
}
#pragma mark - Textfield delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self showPlaceHolderWithString:textField.text andIsShowPlaceHolder:YES];
    return [textField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self showPlaceHolderWithString:lblSearch.text andIsShowPlaceHolder:NO];
    return YES;
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {    
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring
                 stringByReplacingCharactersInRange:range withString:string];
    [self searchLocation:substring];
    return YES;
}

#pragma mark - tableview delegates and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrLocations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutocompleteCellID"];
    cell.textLabel.text = [arrLocations objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showPlaceHolderWithString:[arrLocations objectAtIndex:indexPath.row] andIsShowPlaceHolder:YES];
}
@end
