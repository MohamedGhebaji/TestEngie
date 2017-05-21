//
//  TEMenuCoordinator.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEMenuCoordinator.h"
#import "TEMenuViewController.h"
#import "TEMenuViewModel.h"

@implementation TEMenuCoordinator
@synthesize rootNavigationController, rootViewController, coordinatorDelegate;
- (instancetype)initWithRootNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        self.rootNavigationController = navigationController;
        TEMenuViewController *onboardingViewController = [[TEMenuViewController alloc] initWithViewModel:[[TEMenuViewModel alloc] init]];
        onboardingViewController.backToHomeHandler = ^{
            [self.coordinatorDelegate gotoTask:TECoordinatorTaskOnboarding fromCoordinator:self];
        };
        rootViewController = onboardingViewController;
    }
    return self;
}
@end
