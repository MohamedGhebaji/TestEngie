//
//  TEMenuCoordinator.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TECoordinator.h"

@interface TEMenuCoordinator : NSObject<TECoordinatorType>
- (instancetype)initWithRootNavigationController:(UINavigationController *)navigationController;
@end
