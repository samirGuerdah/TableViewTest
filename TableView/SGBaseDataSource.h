
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.

#import <Foundation/Foundation.h>

@import UIKit;

@class SGBaseTableViewSection;

@interface SGBaseDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray <SGBaseTableViewSection *> *sections;
- (void)registerReusableViews:(UITableView *)tableView;
+ (NSArray <SGBaseTableViewSection*> *)initialSections;
@end
