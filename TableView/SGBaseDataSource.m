//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.


#import "SGBaseDataSource.h"

#import "SGBaseTableViewSection.h"

@implementation SGBaseDataSource

#pragma mark - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   SGBaseTableViewSection *currentSection = self.sections[section];
   return currentSection.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   NSAssert(true, @"Should be implemented by subclasses");
   return nil;
}

- (void)registerReusableViews:(UITableView *)tableView {
   NSAssert(true, @"Should be implemented by subclasses");
}

+ (NSArray <SGBaseTableViewSection*> *)initialSections {
   NSAssert(true, @"Should be implemented by subclasses");
   return nil;
}

@end
