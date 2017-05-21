//
//  TEUser.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEUser.h"
#import "TEAddress.h"
#import "TECompany.h"

@implementation TEUser

#pragma mark - LifeCycle
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _identifier = @([dict[@"id"] integerValue]);
        if (dict[@"user"]) {
            _name = dict[@"user"][@"name"];
            _userName = dict[@"user"][@"userName"];
            _email = dict[@"user"][@"email"];
            _phone = dict[@"user"][@"phone"];
            _website = dict[@"user"][@"website"];
            _address = [[TEAddress alloc] initWithDictionary:dict[@"user"][@"address"]];
            _company = [[TECompany alloc] initWithDictionary:dict[@"user"][@"company"]];
        }
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name userName:(NSString *)userName email:(NSString *)email phone:(NSString *)phone website:(NSString *)website address:(TEAddress *)address company:(TECompany *)company {
    self = [super init];
    if (self) {
        _name = name;
        _userName = userName;
        _email = email;
        _phone = phone;
        _website = website;
        _address = address;
        _company = company;
    }
    return self;
}

#pragma mark - TEJSONEncodableProtocol
- (NSDictionary *)toDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (self.identifier) {
        dict[@"identifier"] = self.identifier;
    }
    if (self.name) {
        dict[@"name"] = self.name;
    }
    if (self.userName) {
        dict[@"userName"] = self.userName;
    }
    if (self.email) {
        dict[@"email"] = self.email;
    }
    if (self.phone) {
        dict[@"phone"] = self.phone;
    }
    if (self.website) {
        dict[@"website"] = self.website;
    }
    if (self.address) {
        dict[@"address"] = [self.address toDictionary];
    }
    if (self.company) {
        dict[@"company"] = [self.company toDictionary];
    }
    return [dict copy];
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _identifier = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(identifier))];
        _name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        _userName = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(userName))];
        _email = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(email))];
        _phone = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(phone))];
        _website = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(website))];
        _address = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(address))];
        _company = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(company))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.identifier forKey:NSStringFromSelector(@selector(identifier))];
    [aCoder encodeObject:self.name forKey:NSStringFromSelector(@selector(name))];
    [aCoder encodeObject:self.userName forKey:NSStringFromSelector(@selector(userName))];
    [aCoder encodeObject:self.email forKey:NSStringFromSelector(@selector(email))];
    [aCoder encodeObject:self.phone forKey:NSStringFromSelector(@selector(phone))];
    [aCoder encodeObject:self.website forKey:NSStringFromSelector(@selector(website))];
    [aCoder encodeObject:self.address forKey:NSStringFromSelector(@selector(address))];
    [aCoder encodeObject:self.company forKey:NSStringFromSelector(@selector(company))];
}

@end
