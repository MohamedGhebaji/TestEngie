//
//  TECompany.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TECompany.h"

@interface TECompany()<NSCoding>

@end

@implementation TECompany

#pragma mark - LifeCycle
- (instancetype)initWithName:(NSString *)name catchPhrase:(NSString *)catchPhrase bs:(NSString *)bs {
    self = [super init];
    if (self) {
        _name = name;
        _catchPhrase = catchPhrase;
        _bs = bs;
    }
    return self;
}

#pragma mark - TEJSONDecodableProtocol
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _name = dict[@"name"];
        _catchPhrase = dict[@"catchPhrase"];
        _bs = dict[@"bs"];
    }
    return self;
}

#pragma mark - TEJSONEncodableProtocol
- (NSDictionary *)toDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (self.name) {
        dict[@"name"] = self.name;
    }
    if (self.catchPhrase) {
        dict[@"catchPhrase"] = self.catchPhrase;
    }
    if (self.bs) {
        dict[@"bs"] = self.bs;
    }
    return [dict copy];
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        _catchPhrase = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(catchPhrase))];
        _bs = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(bs))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeObject:self.catchPhrase forKey:NSStringFromSelector(@selector(catchPhrase))];
    [aCoder encodeObject:self.bs forKey:NSStringFromSelector(@selector(bs))];
}

@end
