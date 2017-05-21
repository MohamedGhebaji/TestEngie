//
//  LocalStorageManager.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TELocalStorageManager.h"

@implementation TELocalStorageManager

+ (id<NSCoding>)savedObjectWithType:(TELocalStorageType)type {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[TELocalStorageManager pathForStorageType:type]];
}

+ (void)saveObject:(id<NSCoding>)object withType:(TELocalStorageType)type {
    [NSKeyedArchiver archiveRootObject:object toFile:[TELocalStorageManager pathForStorageType:type]];
}

+ (NSString *)pathForStorageType:(TELocalStorageType)storageType {
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *key;
    switch (storageType) {
        case TELocalStorageTypeUser:
            key = @"TELocalStorageTypeUser";
            break;
    }
    return [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",key]];
}

+ (Boolean)removeSavedObjectWithType:(TELocalStorageType)type {
    NSString *path = [TELocalStorageManager pathForStorageType:type];
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath: path];
    NSError *error;
    if (exists) {
        [[NSFileManager defaultManager] removeItemAtPath: path error:&error];
    }
    return error != nil;
}

@end
