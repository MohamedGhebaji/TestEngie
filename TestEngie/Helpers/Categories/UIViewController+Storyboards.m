//
//  UIViewController+Storyboards.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "UIViewController+Storyboards.h"

@implementation UIViewController (Storyboards)

+ (instancetype)viewControllerFromStoryboard:(TEStoryboard)storyboardType {
    UIStoryboard *storyboard = [[self class] storyboardFromType:storyboardType];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}

+ (UIStoryboard *)storyboardFromType:(TEStoryboard)type {
    switch (type) {
        case TEStoryboardOnboarding:
            return [UIStoryboard storyboardWithName:@"Onboarding" bundle:nil];
            break;
        case TEStoryboardMenu:
            return [UIStoryboard storyboardWithName:@"Menu" bundle:nil];
            break;
        case TEStoryboardHome:
        return [UIStoryboard storyboardWithName:@"Home" bundle:nil];
            break;
    }
}
@end
