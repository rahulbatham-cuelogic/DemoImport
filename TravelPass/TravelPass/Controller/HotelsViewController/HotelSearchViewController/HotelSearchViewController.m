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
    
    __weak IBOutlet UIView *searchVw;
    __weak IBOutlet UITableView *tblVLocationList;/**< shows the list of locations */
    NSArray *arrLocations; /**< holds the location list data*/
    HotelSearchAPI *objSearchAPI; /**< object to call the search API method of HotelSearchAPI class*/
    __weak IBOutlet UIActivityIndicatorView *indicatorV; /**< shows that the request is taking place and hides when results get fetched */
    __weak IBOutlet UITextField *txtSearch; /**< search the locations when start type the locations */
    __weak IBOutlet UILabel *lblSearch; /**< shows selected text search */

}
@end

@implementation HotelSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrLocations = [[NSArray alloc]init];
    objSearchAPI = [[HotelSearchAPI alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Method
/**
 * will call the api and returns the search results
 */
- (void)searchLocation:(NSString*)strLocation{
    //dispatch_async(dispatch_get_main_queue(), ^{
        indicatorV.hidden = NO;
        [indicatorV startAnimating];
   // });
    [objSearchAPI callSearchAPIWithString:strLocation andResponse:^(NSArray *response,NSError *error) {
        if (!error) {
            arrLocations = response;
            dispatch_async(dispatch_get_main_queue(), ^{
                [tblVLocationList reloadData];
            });
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [indicatorV stopAnimating];
        });
    }];
}
- (void)showLabelWithString:(NSString *)strLocation andIsShowLabel:(BOOL)isShowLabel{
    tblVLocationList.hidden = isShowLabel;
    strLocation = [strLocation stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceCharacterSet]];

    if (isShowLabel) {
        txtSearch.text = @"";
        lblSearch.text = strLocation;
        [txtSearch resignFirstResponder];
    }
    else {
        txtSearch.text = strLocation;
        lblSearch.text = @"";
    }
}

#pragma mark - Actions
- (IBAction)cancel:(id)sender {
    [_delegate cancelPressed:sender];
}
- (IBAction)update:(id)sender {
    if (lblSearch.text.length>0) {
        [_delegate selectedLocation:lblSearch.text];
        [_delegate updatePressed:sender];
    }
    else {
        [Messages showMessage:EMPTYHOTELLIST OnViewController:self];
    }
}
#pragma mark - Textfield delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self showLabelWithString:textField.text andIsShowLabel:YES];
    return [textField resignFirstResponder];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self showLabelWithString:lblSearch.text andIsShowLabel:NO];
    return YES;
}
- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    //tblVLocationList.hidden = NO;
    
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
    [self showLabelWithString:[arrLocations objectAtIndex:indexPath.row] andIsShowLabel:YES];
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
