//
//  TEUser.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEJSONDecodableProtocol.h"
#import "TEJSONEncodableProtocol.h"

@class TECompany, TEAddress;

@interface TEUser : NSObject<TEJSONDecodableProtocol, TEJSONEncodableProtocol, NSCoding>

@property (nonatomic, strong, readonly) NSNumber *identifier;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *userName;
@property (nonatomic, copy, readonly) NSString *email;
@property (nonatomic, copy, readonly) NSString *phone;
@property (nonatomic, copy, readonly) NSString *website;
@property (nonatomic, strong, readonly) TEAddress *address;
@property (nonatomic, strong, readonly) TECompany *company;

- (instancetype)initWithName:(NSString *)name userName:(NSString *)userName email:(NSString *)email phone:(NSString *)phone website:(NSString *)website address:(TEAddress *)address company:(TECompany *)company;
@end
