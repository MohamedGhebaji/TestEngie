//
//  TENetworkingManager.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TEUser;

@interface TENetworkingManager : NSObject
+ (void)subscribeWithUser:(TEUser *)user completionHandler:(TESubscribeUserCompletionHandler)completion;
@end
