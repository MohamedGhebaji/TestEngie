//
//  TEHomeViewController.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TEHomeViewModel;

@interface TEHomeViewController : UIViewController
- (instancetype)initWithViewModel:(TEHomeViewModel *)viewModel;
@end
