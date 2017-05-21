//
//  TESignupViewController.m
//  TestEngie
//
//  Created by Mohamed on 20/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TESignupViewController.h"
#import "TEFieldView.h"
#import "TESignupViewModel.h"
#import "TEAddress.h"
#import "TECompany.h"
#import "TELocalStorageManager.h"

@interface TESignupViewController ()
@property (nonatomic, weak) IBOutlet TEFieldView *nameField;
@property (nonatomic, weak) IBOutlet TEFieldView *usernameField;
@property (nonatomic, weak) IBOutlet TEFieldView *emailField;
@property (nonatomic, weak) IBOutlet TEFieldView *phoneNumberField;
@property (nonatomic, weak) IBOutlet TEFieldView *webSiteField;

@property (nonatomic, weak) IBOutlet TEFieldView *addressField;
@property (nonatomic, weak) IBOutlet TEFieldView *suiteAddressField;
@property (nonatomic, weak) IBOutlet TEFieldView *cityField;
@property (nonatomic, weak) IBOutlet TEFieldView *zipCodeField;

@property (nonatomic, weak) IBOutlet TEFieldView *companyNameField;
@property (nonatomic, weak) IBOutlet TEFieldView *companyCatchPhraseField;
@property (nonatomic, weak) IBOutlet TEFieldView *companyBsField;

@property (nonatomic, strong) TESignupViewModel *viewModel;
@property (nonatomic, assign, getter=isRequestingWS) Boolean requestingWS;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@end

@implementation TESignupViewController

#pragma mark - LifeCycle
- (instancetype)initWithViewModel:(TESignupViewModel *)viewModel {
    self = [TESignupViewController viewControllerFromStoryboard:TEStoryboardOnboarding];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)validateButtonAction:(id)sender {
    if (self.isRequestingWS) {
        return;
    }
    if (self.emailField.isValid) {
        [self.activityIndicatorView startAnimating];
        self.requestingWS = YES;
        //email is valid ==> send the Post request
        TEAddress *address = [[TEAddress alloc] initWithStreet:self.addressField.text suite:self.suiteAddressField.text city:self.cityField.text zipcode:self.zipCodeField.text geo:nil];
        TECompany *company = [[TECompany alloc] initWithName:self.companyNameField.text catchPhrase:self.companyCatchPhraseField.text bs:self.companyBsField.text];
        TEUser *user = [[TEUser alloc] initWithName:self.nameField.text userName:self.usernameField.text email:self.emailField.text phone:self.phoneNumberField.text website:self.webSiteField.text address:address company:company];
        [self.viewModel subscribeWithUser:user completionHandler:^(TEUser *user, NSError *error) {
            [self.activityIndicatorView stopAnimating];
            self.requestingWS = false;
            if (error == nil) {
                //save the user localy
                [TELocalStorageManager saveObject:user withType:TELocalStorageTypeUser];
                //goto home
                if (self.gotoHome) {
                    self.gotoHome();
                }
            } else {
                //show error
                [[[UIAlertView alloc] initWithTitle:@"create.account.empty.email.alert.title".localized message:@"create.account.empty.email.alert.description".localized delegate:nil cancelButtonTitle:@"alert.common.ok".localized otherButtonTitles:nil, nil] show];
            }
        }];
    } else {
        //email is not valid ==> show alert view
        [[[UIAlertView alloc] initWithTitle:@"create.account.empty.email.alert.title".localized message:@"create.account.empty.email.alert.description".localized delegate:nil cancelButtonTitle:@"alert.common.ok".localized otherButtonTitles:nil, nil] show];
    }
}
    
#pragma mark - Private Methods
- (void)setupView {
    self.title = @"create.account.screen.title".localized;
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.activityIndicatorView.hidesWhenStopped = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicatorView];
    self.emailField.validator = ^(NSString *text){
        return [self.viewModel validateEmail:text];
    };
}


@end
