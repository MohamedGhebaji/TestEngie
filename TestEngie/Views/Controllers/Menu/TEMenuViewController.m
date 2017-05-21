//
//  TEMenuViewController.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEMenuViewController.h"
#import "TEMenuButtonCell.h"
#import "TEMenuViewModel.h"

@interface TEMenuViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) TEMenuViewModel *viewModel;
@end

@implementation TEMenuViewController

#pragma mark - LifeCycle
- (instancetype)initWithViewModel:(TEMenuViewModel *)viewModel {
    self = [TEMenuViewController viewControllerFromStoryboard:TEStoryboardMenu];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UItableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TEMenuButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TEMenuButtonCell.class) forIndexPath:indexPath];
    cell.didSelectAction = ^{
        [self.viewModel logoutUserWithCompletion:^{
            if (self.backToHomeHandler) {
                self.backToHomeHandler();
            }
        }];
    };
    return cell;
}

#pragma mark - <UItableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

@end
