//
//  TEHomeCoordinator.h
//  TestEngie
//
//  Created by Mohamed on 20/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TECoordinator.h"

@interface TEHomeCoordinator : NSObject<TECoordinatorType>
- (instancetype)initWithRootNavigationController:(UINavigationController *)navigationController;
@end
