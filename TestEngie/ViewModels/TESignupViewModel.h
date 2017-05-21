//
//  TESignupViewModel.h
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEHandlers.h"

@class TEUser;

@interface TESignupViewModel : NSObject
- (void)subscribeWithUser:(TEUser *)user completionHandler:(TESubscribeUserCompletionHandler)completion;
- (Boolean)validateEmail:(NSString *)email;
@end
