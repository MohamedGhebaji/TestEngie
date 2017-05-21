//
//  TEHomeViewController.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEHomeViewController.h"
#import "AppDelegate.h"
#import "TEAppCoordinator.h"
#import "TEMenuViewController.h"
#import "TEHomeViewModel.h"
#import "TEUserInfoCell.h"

@interface TEHomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UIView *menuFilterView;
@property (nonatomic, strong) NSLayoutConstraint *menuLeadingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *menuTrealingConstraint;
@property (nonatomic, strong) TEHomeViewModel *viewModel;
@end

@implementation TEHomeViewController

#pragma mark - LifeCycle
- (instancetype)initWithViewModel:(TEHomeViewModel *)viewModel {
    self = [TEHomeViewController viewControllerFromStoryboard:TEStoryboardHome];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self addMenuViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)closeMenuAction:(UITapGestureRecognizer *)gesture {
    [self toogleMenu:NO animated:YES];
}

#pragma mark - Private Methods
- (void)setupView {
    self.title = @"home.screen.title".localized;
    //add leftBarButton item, in prod project shoudl be done in parentViewController
    UIImage *openMenuImage = [UIImage imageNamed:@"ic_toogle_menu"];
    UIButton *toogleMenuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, openMenuImage.size.width, openMenuImage.size.height)];
    [toogleMenuButton setImage:openMenuImage forState:UIControlStateNormal];
    [toogleMenuButton addTarget:self action:@selector(openMenuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:toogleMenuButton];
}

- (void)addMenuViewController {
    AppDelegate *appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
    TEMenuViewController *menuViewController = (TEMenuViewController *)[appDelegate.appCoordinator coordinatorForType:TECoordinatorTaskMenu].rootViewController;
    [self addChildViewController:menuViewController];
    menuViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:menuViewController.view];
    NSArray<NSLayoutConstraint *> *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:0 views:@{@"view":menuViewController.view}];
    self.menuLeadingConstraint = vConstraints[0];
    self.menuTrealingConstraint = vConstraints[1];
    [self.view addConstraints:vConstraints];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:@{@"view":menuViewController.view}]];
    [menuViewController didMoveToParentViewController:self];
    //hide the menu initialy
    [self toogleMenu:NO animated:NO];
}

- (void)toogleMenu:(Boolean)show animated:(Boolean)animated {
    CGFloat menuWidth = [UIScreen mainScreen].bounds.size.width;
    self.menuTrealingConstraint.constant = show ? 30.0 : menuWidth;
    self.menuLeadingConstraint.constant = show ? 0 : -menuWidth;
    [UIView animateWithDuration:animated ? 0.3 : 0.0 animations:^{
        self.menuFilterView.alpha = show ? 1 : 0;
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Actions
- (IBAction)openMenuButtonAction:(id)sender {
    [self toogleMenu:self.menuTrealingConstraint.constant != 0 animated:YES];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataSource[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TEUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(TEUserInfoCell.class) forIndexPath:indexPath];
    TEHomeItem item = (TEHomeItem)[self.viewModel.dataSource[indexPath.section][indexPath.item] integerValue];
    NSString *leftText = [self.viewModel leftTextOfItem:item];
    NSString *rightText = [self.viewModel rightTextOfItem:item];
    [cell configureWithLeftText:leftText rightText:rightText];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.viewModel titleOfSection:section];
}
@end
