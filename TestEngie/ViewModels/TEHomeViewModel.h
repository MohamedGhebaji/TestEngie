//
//  TEHomeViewModel.h
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TEHomeSection) {
    TEHomeSectionInformation,
    TEHomeSectionAddress,
    TEHomeSectionCompany
};

typedef NS_ENUM(NSInteger, TEHomeItem) {
    TEHomeItemName,
    TEHomeItemUserName,
    TEHomeItemEmail,
    TEHomeItemPhone,
    TEHomeItemWebsite,
    TEHomeItemStreet,
    TEHomeItemSuite,
    TEHomeItemCity,
    TEHomeItemZipcode,
    TEHomeItemCompanyName,
    TEHomeItemCompanyCatchPhrase,
    TEHomeItemBs
};

@class TEUser;
@interface TEHomeViewModel : NSObject
@property (nonatomic, copy, readonly) NSArray<NSArray *> *dataSource;
- (NSString *)titleOfSection:(TEHomeSection)section;
- (NSString *)leftTextOfItem:(TEHomeItem)item;
- (NSString *)rightTextOfItem:(TEHomeItem)item;
- (instancetype)initWithUser:(TEUser *)user;
@end
