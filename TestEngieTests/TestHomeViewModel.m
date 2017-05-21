//
//  TestSignupViewModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TEHomeViewModel.h"
#import "TEUser.h"
#import "NSString+Localized.h"

@interface TestHomeViewModel : XCTestCase
@property (nonatomic, strong) TEHomeViewModel *viewModel;
@end

@implementation TestHomeViewModel

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    TEUser *user = [[TEUser alloc] initWithName:@"name" userName:@"username" email:@"xx@vv.fr" phone:@"0783160619" website:@"https://github.com/MohamedGhebaji/TestEngie" address:nil company:nil];
    self.viewModel = [[TEHomeViewModel alloc] initWithUser:user];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSectionCount {
    XCTAssertEqual(self.viewModel.dataSource.count, 3);
}

- (void)testItemForSection1 {
    XCTAssertEqual(self.viewModel.dataSource[0].count, 5);
}

- (void)testItemForSection2 {
    XCTAssertEqual(self.viewModel.dataSource[1].count, 4);
}

- (void)testItemForSection3 {
    XCTAssertEqual(self.viewModel.dataSource[2].count, 3);
}

- (void)testSection1Title {
    XCTAssertEqual([self.viewModel titleOfSection:TEHomeSectionInformation], @"home.section.1.title".localized);
}

- (void)testSection2Title {
    XCTAssertEqual([self.viewModel titleOfSection:TEHomeSectionAddress], @"home.section.2.title".localized);
}

- (void)testSection3Title {
    XCTAssertEqual([self.viewModel titleOfSection:TEHomeSectionCompany], @"home.section.3.title".localized);
}

@end
