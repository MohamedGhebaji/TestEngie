//
//  TECoordinatorDelegate.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TECoordinatorTask.h"

@protocol TECoordinatorType;
@protocol TECoordinatorDelegate <NSObject>
@optional
- (void)gotoTask:(TECoordinatorTask)task fromCoordinator:(id<TECoordinatorType>)coordinator;
@end

@protocol TECoordinatorType <NSObject>
@property (nonatomic, unsafe_unretained) id<TECoordinatorDelegate> coordinatorDelegate;
@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) UINavigationController *rootNavigationController;
@end
