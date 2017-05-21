//
//  TEMenuViewController.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TEMenuViewModel;

@interface TEMenuViewController : UIViewController
@property (nonatomic, copy) TEEmptyHandler backToHomeHandler;
- (instancetype)initWithViewModel:(TEMenuViewModel *)viewModel;
@end
