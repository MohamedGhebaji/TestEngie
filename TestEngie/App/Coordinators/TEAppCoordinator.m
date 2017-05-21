//
//  TEAppCoordinator.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEAppCoordinator.h"
#import "TERootNavigationController.h"
#import "TELocalStorageManager.h"
#import "TERootNavigationController.h"
#import "TEOnboardingCoordinator.h"
#import "TEHomeCoordinator.h"
#import "TEMenuCoordinator.h"

@interface TEAppCoordinator()<TECoordinatorDelegate>
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) TERootNavigationController *rootNavigationController;
@end

@implementation TEAppCoordinator

#pragma mark - LifeCycle
- (instancetype)initWithWindow:(UIWindow *)window {
    self = [super init];
    if (self) {
        self.window = window;
        self.rootNavigationController = [[TERootNavigationController alloc] init];
        if ([TELocalStorageManager savedObjectWithType:TELocalStorageTypeUser] == nil) {
            //go to onboarding
            [self gotoTask:TECoordinatorTaskOnboarding];
        } else {
            //go directly to the home
            [self gotoTask:TECoordinatorTaskHome];
        }
    }
    return self;
}

#pragma mark - Private Methods
- (void)gotoTask:(TECoordinatorTask)task {
    id<TECoordinatorType> coordinator = [self coordinatorForType:task];
    if (coordinator && coordinator.rootViewController) {
        switch (task) {
            case TECoordinatorTaskOnboarding:
                self.rootNavigationController.viewControllers = @[coordinator.rootViewController];
                self.window.rootViewController = self.rootNavigationController;
                break;
            case TECoordinatorTaskHome:
                self.rootNavigationController.viewControllers = @[coordinator.rootViewController];
                self.window.rootViewController = self.rootNavigationController;
                break;
            default: break;
        }
    }
}

- (id<TECoordinatorType>)coordinatorForType:(TECoordinatorTask)task {
    id<TECoordinatorType> coordinator;
    switch (task) {
        case TECoordinatorTaskOnboarding:
            coordinator = [[TEOnboardingCoordinator alloc] initWithRootNavigationController:self.rootNavigationController];
            break;
        case TECoordinatorTaskHome:
            coordinator = [[TEHomeCoordinator alloc] initWithRootNavigationController:self.rootNavigationController];
            break;
        case TECoordinatorTaskMenu:
            coordinator = [[TEMenuCoordinator alloc] initWithRootNavigationController:self.rootNavigationController];
            break;
    }
    coordinator.coordinatorDelegate = self;
    return coordinator;
}

#pragma mark - <TECoordinatorDelegate>
- (void)gotoTask:(TECoordinatorTask)task fromCoordinator:(id<TECoordinatorType>)coordinator {
    [self gotoTask:task];
}
@end
