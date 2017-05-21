//
//  TestCompanyModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TECompany.h"

@interface TestCompanyModel : XCTestCase
@property (nonatomic, strong) TECompany *company;
@end

@implementation TestCompanyModel

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.company = [[TECompany alloc] initWithName:@"Engie" catchPhrase:@"catchEngie" bs:@"bsEngie"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCompanyName {
    XCTAssertEqual(self.company.name, @"Engie");
}

- (void)testCompanyCatchPhrase {
    XCTAssertEqual(self.company.catchPhrase, @"catchEngie");
}

- (void)testCompanyBs {
    XCTAssertEqual(self.company.bs, @"bsEngie");
}
@end
