//
//  TEHandlers.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEUser.h"

#ifndef TEHandlers_h
#define TEHandlers_h

typedef void (^TESubscribeUserCompletionHandler)(TEUser *user, NSError *error);
typedef void (^TEEmptyHandler)();
#endif /* TEHandlers_h */
