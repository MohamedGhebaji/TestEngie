//
//  TEAppCoordinator.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TECoordinator.h"

@interface TEAppCoordinator : NSObject
- (instancetype)initWithWindow:(UIWindow *)window;
- (id<TECoordinatorType>)coordinatorForType:(TECoordinatorTask)task;
@end
