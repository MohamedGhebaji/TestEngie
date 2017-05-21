//
//  NSString+Localized.m
//  TestEngie
//
//  Created by Mohamed on 20/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "NSString+Localized.h"

@implementation NSString (Localized)
- (NSString *)localized {
    return NSLocalizedString(self, nil);
}
@end
