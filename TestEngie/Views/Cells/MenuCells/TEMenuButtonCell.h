//
//  TEMenuButtonCell.h
//  TestEngie
//
//  Created by Mohamed on 21/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TEMenuButtonCell : UITableViewCell
@property (nonatomic, copy) void (^didSelectAction)();
@end
