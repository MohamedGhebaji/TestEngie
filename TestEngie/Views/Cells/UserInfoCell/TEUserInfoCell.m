//
//  TEUserInfoCell.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEUserInfoCell.h"

@interface TEUserInfoCell()
@property (nonatomic, weak) IBOutlet UILabel *leftLabel;
@property (nonatomic, weak) IBOutlet UILabel *rightLabel;
@end

@implementation TEUserInfoCell

#pragma mark - LifeCycle
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public Methods
- (void)configureWithLeftText:(NSString *)leftText rightText:(NSString *)rightText {
    self.leftLabel.text = leftText;
    self.rightLabel.text = rightText;
}

@end
