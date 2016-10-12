//
//  SignUpViewController.m
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "Utility.h"
#import "APICommunicator.h"

@interface SignUpViewController ()
{
    __weak IBOutlet UILabel *lblWelcomeText;
    __weak IBOutlet UILabel *lblWelcomeNote;
    __weak IBOutlet UILabel *lblSignUp;
    __weak IBOutlet UILabel *lblWithSocialMedia;
    __weak IBOutlet UILabel *lblOr;
    __weak IBOutlet UITextField *txtFldEmail;
    __weak IBOutlet UITextField *txtFldPassword;
    __weak IBOutlet UIButton *btnContinue;
    __weak IBOutlet UIButton *btnDoThisLater;
    __weak IBOutlet UIButton *btnSignIn;
}
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self setLanguageString];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Methods
- (void)setLanguageString{
    lblWelcomeText.text = NSLocalizedString(WELCOME_TEXT, nil);
    lblWelcomeNote.text = NSLocalizedString(WELCOME_NOTE, nil);
    lblSignUp.text = NSLocalizedString(SIGNUP, nil);
    lblWithSocialMedia.text = NSLocalizedString(WITH_SOCIAL_MEDIA, nil);
    lblOr.text = NSLocalizedString(OR, nil);
    txtFldEmail.placeholder = NSLocalizedString(@"EMAIL", nil);
    txtFldPassword.placeholder = NSLocalizedString(@"PASSWORD", nil);
    [btnContinue setTitle:NSLocalizedString(CONTINUE, nil) forState:UIControlStateNormal];
    [btnDoThisLater setTitle:NSLocalizedString(DO_THIS_LATER, nil) forState:UIControlStateNormal];
    [btnSignIn setTitle:NSLocalizedString(SIGNIN, nil) forState:UIControlStateNormal];
    
   
    lblWelcomeText.font = [lblWelcomeText.font fontWithSize:lblWelcomeText.font.pointSize*fontScale];
    lblWelcomeNote.font = [lblWelcomeNote.font fontWithSize:lblWelcomeNote.font.pointSize*fontScale];
    lblSignUp.font = [lblSignUp.font fontWithSize:lblSignUp.font.pointSize*fontScale];
    lblWithSocialMedia.font = [lblWithSocialMedia.font fontWithSize:lblWithSocialMedia.font.pointSize*fontScale];
    lblOr.font = [lblOr.font fontWithSize:lblOr.font.pointSize*fontScale];
    txtFldEmail.font = [txtFldEmail.font fontWithSize:txtFldEmail.font.pointSize*fontScale];
    txtFldPassword.font = [txtFldPassword.font fontWithSize:txtFldPassword.font.pointSize*fontScale];
    btnContinue.titleLabel.font = [btnContinue.titleLabel.font fontWithSize:btnContinue.titleLabel.font.pointSize*fontScale];
    btnDoThisLater.titleLabel.font = [btnDoThisLater.titleLabel.font fontWithSize:btnDoThisLater.titleLabel.font.pointSize*fontScale];
    btnSignIn.titleLabel.font = [btnSignIn.titleLabel.font fontWithSize:btnSignIn.titleLabel.font.pointSize*fontScale];
}

#pragma mark - Actions
- (IBAction)doThisLater:(id)sender {
    [APPDELEGATE setSideMenuViewAsRootViewContoller];
}

@end
