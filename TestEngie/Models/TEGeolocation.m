//
//  TEGeolocation.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEGeolocation.h"

@interface TEGeolocation()<NSCoding>
@end

@implementation TEGeolocation

#pragma mark - TEJSONDecodableProtocol
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _lat = @([dict[@"lat"] integerValue]);
        _lng = @([dict[@"lng"] integerValue]);
    }
    return self;
}

#pragma mark - TEJSONEncodableProtocol
- (NSDictionary *)toDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (self.lat) {
        dict[@"lat"] = self.lat;
    }
    if (self.lng) {
        dict[@"lng"] = self.lng;
    }
    return [dict copy];
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _lat = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(lat))];
        _lng = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(lng))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.lat forKey:NSStringFromSelector(@selector(lat))];
    [aCoder encodeObject:self.lng forKey:NSStringFromSelector(@selector(lng))];
}
@end
