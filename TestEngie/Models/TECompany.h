//
//  TECompany.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEJSONDecodableProtocol.h"
#import "TEJSONEncodableProtocol.h"

@interface TECompany : NSObject<TEJSONDecodableProtocol, TEJSONEncodableProtocol>
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *catchPhrase;
@property (nonatomic, copy, readonly) NSString *bs;

- (instancetype)initWithName:(NSString *)name catchPhrase:(NSString *)catchPhrase bs:(NSString *)bs;
@end
