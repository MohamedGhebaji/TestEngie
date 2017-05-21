//
//  TEHomeViewModel.m
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TEHomeViewModel.h"
#import "TECompany.h"
#import "TEAddress.h"

@interface TEHomeViewModel()
@property (nonatomic, strong) TEUser *user;
@end

@implementation TEHomeViewModel

#pragma mark - LifeCycle
- (instancetype)initWithUser:(TEUser *)user {
    self = [super init];
    if (self) {
        self.user = user;
        _dataSource = @[
                        @[@(TEHomeItemName), @(TEHomeItemUserName), @(TEHomeItemEmail), @(TEHomeItemPhone), @(TEHomeItemWebsite)],
                        @[@(TEHomeItemStreet), @(TEHomeItemSuite), @(TEHomeItemCity), @(TEHomeItemZipcode)],
                        @[@(TEHomeItemCompanyName), @(TEHomeItemCompanyCatchPhrase), @(TEHomeItemBs)]
                        ];
    }
    return self;
}

#pragma mark - Public Methods
- (NSString *)titleOfSection:(TEHomeSection)section {
    switch (section) {
        case TEHomeSectionInformation:
            return @"home.section.1.title".localized;
            break;
        case TEHomeSectionAddress:
            return @"home.section.2.title".localized;
            break;
        case TEHomeSectionCompany:
            return @"home.section.3.title".localized;
    }
}

- (NSString *)leftTextOfItem:(TEHomeItem)item {
    switch (item) {
        case TEHomeItemName:
            return @"signup.name".localized;
            break;
        case TEHomeItemUserName:
            return @"signup.user.name".localized;
            break;
        case TEHomeItemEmail:
            return @"signup.email".localized;
            break;
        case TEHomeItemPhone:
            return @"signup.zip.phone".localized;
            break;
        case TEHomeItemWebsite:
            return @"signup.zip.website".localized;
            break;
        case TEHomeItemStreet:
            return @"signup.address".localized;
            break;
        case TEHomeItemSuite:
            return @"signup.address".localized;
            break;
        case TEHomeItemCity:
            return @"signup.city".localized;
            break;
        case TEHomeItemZipcode:
            return @"signup.zip.code".localized;
            break;
        case TEHomeItemCompanyName:
            return @"signup.company.name".localized;
            break;
        case TEHomeItemCompanyCatchPhrase:
            return @"signup.company.catchPhrase".localized;
            break;
        case TEHomeItemBs:
            return @"signup.company.bs".localized;
            break;
    }
}

- (NSString *)rightTextOfItem:(TEHomeItem)item {
    switch (item) {
        case TEHomeItemName:
            return self.user.name;
            break;
        case TEHomeItemUserName:
            return self.user.userName;
            break;
        case TEHomeItemEmail:
            return self.user.email;
            break;
        case TEHomeItemPhone:
            return self.user.phone;
            break;
        case TEHomeItemWebsite:
            return self.user.website;
            break;
        case TEHomeItemStreet:
            return self.user.address.street;
            break;
        case TEHomeItemSuite:
            return self.user.address.suite;
            break;
        case TEHomeItemCity:
            return self.user.address.city;
            break;
        case TEHomeItemZipcode:
            return self.user.address.zipcode;
            break;
        case TEHomeItemCompanyName:
            return self.user.company.name;
            break;
        case TEHomeItemCompanyCatchPhrase:
            return self.user.company.catchPhrase;
            break;
        case TEHomeItemBs:
            return self.user.company.bs;
            break;
    }
}

@end
