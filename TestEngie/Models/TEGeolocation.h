//
//  TEGeolocation.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEJSONDecodableProtocol.h"
#import "TEJSONEncodableProtocol.h"

@interface TEGeolocation : NSObject<TEJSONDecodableProtocol, TEJSONEncodableProtocol>
@property (nonatomic, strong, readonly) NSNumber *lat;
@property (nonatomic, strong, readonly) NSNumber *lng;
@end
