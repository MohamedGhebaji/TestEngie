//
//  TELocalizedButton.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TELocalizedButton.h"

@implementation TELocalizedButton

#pragma mark - LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setTitle:self.titleLabel.text.localized forState:UIControlStateNormal];
}

@end
