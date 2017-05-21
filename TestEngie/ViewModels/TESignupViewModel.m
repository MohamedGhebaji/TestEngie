//
//  TESignupViewModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TESignupViewModel.h"
#import "TENetworkingManager.h"

@implementation TESignupViewModel
#pragma mark - Public Methods
- (void)subscribeWithUser:(TEUser *)user completionHandler:(TESubscribeUserCompletionHandler)completion {
    [TENetworkingManager subscribeWithUser:user completionHandler:completion];
}

- (Boolean)validateEmail:(NSString *)email {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [emailPredicate evaluateWithObject:email];
}
@end
