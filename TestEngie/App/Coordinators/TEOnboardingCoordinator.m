//
//  TEOnboardingCoordinator.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEOnboardingCoordinator.h"
#import "TEOnboardingViewController.h"
#import "TESignupViewController.h"
#import "TESignupViewModel.h"

@implementation TEOnboardingCoordinator
@synthesize rootNavigationController, rootViewController, coordinatorDelegate;
- (instancetype)initWithRootNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        self.rootNavigationController = navigationController;
        TEOnboardingViewController *onboardingViewController = [TEOnboardingViewController viewControllerFromStoryboard:TEStoryboardOnboarding];
        onboardingViewController.goToSignup = ^{
            TESignupViewController *signupViewController = [[TESignupViewController alloc] initWithViewModel:[[TESignupViewModel alloc] init]];
            signupViewController.gotoHome = ^{
                [self.coordinatorDelegate gotoTask:TECoordinatorTaskHome fromCoordinator:self];
            };
            [self.rootNavigationController pushViewController:signupViewController animated:YES];
        };
        rootViewController = onboardingViewController;
    }
    return self;
}
@end
