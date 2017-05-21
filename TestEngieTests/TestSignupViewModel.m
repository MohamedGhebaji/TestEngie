//
//  TestSignupViewModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TESignupViewModel.h"

@interface TestSignupViewModel : XCTestCase
@property (nonatomic, strong) TESignupViewModel *viewModel;
@end

@implementation TestSignupViewModel

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.viewModel = [[TESignupViewModel alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmailIsValid {
    Boolean isEmailValid = [self.viewModel validateEmail:@"tes@test.fr"];
    XCTAssertEqual(isEmailValid, YES);
}
@end
