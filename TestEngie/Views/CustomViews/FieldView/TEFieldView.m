//
//  TEFieldView.m
//  TestEngie
//
//  Created by Mohamed on 20/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEFieldView.h"

@interface TEFieldView()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextField *contentTextField;
@end

@implementation TEFieldView

#pragma mark - LifeCycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

#pragma mark - Get/Set
- (void)setLocalizedTitle:(NSString *)localizedTitle {
    self.titleLabel.text = localizedTitle.localized;
}

- (NSString *)text {
    return self.contentTextField.text;
}

- (Boolean)isValid {
    if (self.validator) {
        //custom validator
        return self.validator(self.contentTextField.text);
    } else {
        //default validator
        return self.contentTextField.text == nil || [self.contentTextField.text isEqualToString:@""];
    }
}

#pragma mark - Private Methods
- (void)commonInit {
    UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(TEFieldView.class) owner:self options:nil].firstObject;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    
    self.contentTextField.layer.borderColor = [UIColor grayColor].CGColor;
    self.contentTextField.layer.borderWidth = 1.f;
}

@end
