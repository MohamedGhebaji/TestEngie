//
//  TEHomeCoordinator.m
//  TestEngie
//
//  Created by Mohamed on 20/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEHomeCoordinator.h"
#import "TEHomeViewController.h"
#import "TEHomeViewModel.h"
#import "TELocalStorageManager.h"

@implementation TEHomeCoordinator
@synthesize rootNavigationController, rootViewController, coordinatorDelegate;
- (instancetype)initWithRootNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        self.rootNavigationController = navigationController;
        TEHomeViewModel *viewModel = [[TEHomeViewModel alloc] initWithUser:(TEUser *)([TELocalStorageManager savedObjectWithType:TELocalStorageTypeUser])];
        TEHomeViewController *onboardingViewController = [[TEHomeViewController alloc] initWithViewModel:viewModel];
        rootViewController = onboardingViewController;
    }
    return self;
}
@end
