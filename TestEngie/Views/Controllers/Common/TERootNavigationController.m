//
//  TERootNavigationController.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TERootNavigationController.h"

@interface TERootNavigationController ()

@end

@implementation TERootNavigationController

#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (void)setupView {
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = [UIColor colorFromHexString:@"00A8FF"];
}

@end
