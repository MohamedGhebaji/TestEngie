//
//  TEOnboardingViewController.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEOnboardingViewController.h"

@interface TEOnboardingViewController ()

@end

@implementation TEOnboardingViewController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)gotoSignupButtonAction:(id)sender {
    if (self.goToSignup) {
        self.goToSignup();
    }
}

@end
