//
//  TestAddressModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TEGeolocation.h"
#import "TEAddress.h"


@interface TestAddressModel : XCTestCase
@property (nonatomic, strong) TEAddress *address;
@end

@implementation TestAddressModel

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.address = [[TEAddress alloc] initWithStreet:@"street" suite:@"suite street" city:@"Paris" zipcode:@"75000" geo:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStreet {
    XCTAssertEqual(self.address.street, @"street");
}

- (void)testSuite {
    XCTAssertEqual(self.address.suite, @"suite street");
}

- (void)testCity {
    XCTAssertEqual(self.address.city, @"Paris");
}

- (void)testZipCode {
    XCTAssertEqual(self.address.zipcode, @"75000");
}

- (void)testGeo {
    XCTAssertEqual(self.address.geo, nil);
}
@end
