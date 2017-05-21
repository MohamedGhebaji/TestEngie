//
//  UIViewController+Storyboards.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TEStoryboard.h"

@interface UIViewController (Storyboards)
+ (instancetype)viewControllerFromStoryboard:(TEStoryboard)storyboard;
@end
