//
//  TEMenuViewModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEMenuViewModel.h"
#import "TELocalStorageManager.h"

@implementation TEMenuViewModel
- (void)logoutUserWithCompletion:(TEEmptyHandler)completionHandler {
    Boolean success = [TELocalStorageManager removeSavedObjectWithType:TELocalStorageTypeUser];
    completionHandler();
}
@end
