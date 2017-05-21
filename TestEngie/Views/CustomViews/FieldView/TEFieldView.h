//
//  TEFieldView.h
//  TestEngie
//
//  Created by Mohamed on 20/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TEFieldView : UIView
@property (nonatomic, copy) Boolean (^validator)(NSString *text);
@property (nonatomic, assign, readonly, getter=isValid) Boolean valid;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy) IBInspectable NSString *localizedTitle;
@end
