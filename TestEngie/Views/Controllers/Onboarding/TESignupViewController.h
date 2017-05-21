//
//  TESignupViewController.h
//  TestEngie
//
//  Created by Mohamed on 20/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TESignupViewModel;
@interface TESignupViewController : UIViewController
@property (nonatomic, copy) void (^gotoHome)();
- (instancetype)initWithViewModel:(TESignupViewModel *)viewModel;
@end
