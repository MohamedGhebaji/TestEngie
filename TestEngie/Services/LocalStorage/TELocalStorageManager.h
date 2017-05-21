//
//  LocalStorageManager.h
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TELocalStorageType) {
    TELocalStorageTypeUser
};

@interface TELocalStorageManager : NSObject
+ (id<NSCoding>)savedObjectWithType:(TELocalStorageType)type;
+ (void)saveObject:(id<NSCoding>)object withType:(TELocalStorageType)type;
+ (Boolean)removeSavedObjectWithType:(TELocalStorageType)type;
@end
