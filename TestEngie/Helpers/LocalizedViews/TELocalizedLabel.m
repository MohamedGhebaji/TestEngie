//
//  TELocalizedLabel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TELocalizedLabel.h"

@implementation TELocalizedLabel

#pragma mark - LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
    self.text = self.text.localized;
}

@end
