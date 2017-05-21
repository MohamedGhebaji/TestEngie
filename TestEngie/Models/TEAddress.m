//
//  TEAddress.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEAddress.h"
#import "TEGeolocation.h"

@interface TEAddress()<NSCoding>
@end

@implementation TEAddress

#pragma mark - TEJSONDecodableProtocol
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _street = dict[@"street"];
        _suite = dict[@"suite"];
        _city = dict[@"city"];
        _zipcode = dict[@"zipcode"];
        _geo = [[TEGeolocation alloc] initWithDictionary:dict[@"geo"]];
    }
    return self;
}

#pragma mark - TEJSONEncodableProtocol
- (NSDictionary *)toDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (self.street) {
        dict[@"street"] = self.street;
    }
    if (self.suite) {
        dict[@"suite"] = self.suite;
    }
    if (self.city) {
        dict[@"city"] = self.city;
    }
    if (self.zipcode) {
        dict[@"zipcode"] = self.zipcode;
    }
    if (self.geo) {
        dict[@"geo"] = [self.geo toDictionary];
    }
    return [dict copy];
}

- (instancetype)initWithStreet:(NSString *)street suite:(NSString *)suite city:(NSString *)city zipcode:(NSString *)zipcode geo:(TEGeolocation *)geo {
    self = [super init];
    if (self) {
        _street = street;
        _suite = suite;
        _city = city;
        _zipcode = zipcode;
        _geo = geo;
    }
    return self;
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _street = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(street))];
        _suite = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(suite))];
        _city = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(city))];
        _zipcode = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(zipcode))];
        _geo = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(geo))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.street forKey:NSStringFromSelector(@selector(street))];
    [aCoder encodeObject:self.suite forKey:NSStringFromSelector(@selector(suite))];
    [aCoder encodeObject:self.city forKey:NSStringFromSelector(@selector(city))];
    [aCoder encodeObject:self.zipcode forKey:NSStringFromSelector(@selector(zipcode))];
    [aCoder encodeObject:self.geo forKey:NSStringFromSelector(@selector(geo))];
}

@end
