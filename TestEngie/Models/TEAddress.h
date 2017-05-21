//
//  TEAddress.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEJSONDecodableProtocol.h"
#import "TEJSONEncodableProtocol.h"

@class TEGeolocation;

@interface TEAddress : NSObject<TEJSONDecodableProtocol, TEJSONEncodableProtocol>
@property (nonatomic, copy, readonly) NSString *street;
@property (nonatomic, copy, readonly) NSString *suite;
@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *zipcode;
@property (nonatomic, strong, readonly) TEGeolocation *geo;

- (instancetype)initWithStreet:(NSString *)street suite:(NSString *)suite city:(NSString *)city zipcode:(NSString *)zipcode geo:(TEGeolocation *)geo;
@end
