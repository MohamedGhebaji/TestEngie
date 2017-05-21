//
//  AppDelegate.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TEAppCoordinator;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) TEAppCoordinator *appCoordinator;

@end

