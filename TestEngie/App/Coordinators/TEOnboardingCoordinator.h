//
//  TEOnboardingCoordinator.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TECoordinator.h"

@interface TEOnboardingCoordinator : NSObject<TECoordinatorType>
- (instancetype)initWithRootNavigationController:(UINavigationController *)navigationController;
@end
