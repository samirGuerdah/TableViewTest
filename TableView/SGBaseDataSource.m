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

- (SGBaseTableViewSection *)sectionForType:(NSUInteger)sectionType {
   for (SGBaseTableViewSection *section in self.sections) {
      if (section.type == sectionType) {
         return section;
      }
   }
   return nil;
}

+ (NSArray <SGBaseTableViewRow *> *)rowsForSection:(SGBaseTableViewSection *)section {
   NSAssert(true, @"Should be implemented by subclasses");
   return nil;
}

- (void)updateSections {
   for (SGBaseTableViewSection *section in self.sections) {
      if (section.state == SGTableViewSectionStateClosed) {
         section.rows = @[];
      }
      else{
         section.rows = [self.class rowsForSection:section];
      }
   }
}

- (void)toggleSectionType:(NSUInteger)sectionType forTableView:(UITableView *)tableView {
   SGBaseTableViewSection *section = [self sectionForType:sectionType];
   SGTableViewSectionState sectionState = section.state;
   if (sectionState == SGTableViewSectionStateFrozen) { return;}
   
   NSIndexSet *sectionSet = [NSIndexSet indexSetWithIndex:sectionType];
   
   if (sectionState == SGTableViewSectionStateClosed) {
      section.state = SGTableViewSectionStateOpened;
   }
   
   if (sectionState == SGTableViewSectionStateOpened) {
      section.state = SGTableViewSectionStateClosed;
   }
   
   // Update the sections
   [self updateSections];
   
   // Reload the tableView
   [tableView reloadSections:sectionSet withRowAnimation:UITableViewRowAnimationAutomatic];
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

- (UIView *)headerViewForSectionType:(NSUInteger)sectionType {
   NSAssert(true, @"Should be implemented by subclasses");
   return nil;
}

@end
