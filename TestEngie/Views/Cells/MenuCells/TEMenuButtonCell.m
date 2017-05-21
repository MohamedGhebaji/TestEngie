//
//  TEMenuButtonCell.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEMenuButtonCell.h"

@implementation TEMenuButtonCell

#pragma mark - LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Actions
- (IBAction)buttonAction:(id)sender {
    if (self.didSelectAction) {
        self.didSelectAction();
    }
}

@end
