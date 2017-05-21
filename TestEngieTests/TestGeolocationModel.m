//
//  TestGeolocationModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TEGeolocation.h"

@interface TestGealocationModel : XCTestCase
@property (nonatomic, strong) TEGeolocation *geo;
@end

@implementation TestGealocationModel

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.geo = [[TEGeolocation alloc] initWithDictionary:@{@"lat":@123, @"lng":@456}];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testlat{
    XCTAssertEqual(self.geo.lat.integerValue, 123);
}

- (void)testlng {
    XCTAssertEqual(self.geo.lng.integerValue, 456);
}

@end
