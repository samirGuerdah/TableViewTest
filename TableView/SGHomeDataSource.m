
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.


#import "SGHomeDataSource.h"

#import "SGBaseTableViewSection.h"
#import "SGBaseTableViewRow.h"

// Cells && Views
#import "SGLabelCell.h"
#import "SGButtonCell.h"
#import "SGHomeHeaderView.h"

// Enums representing the rows and sections
typedef NS_ENUM(NSInteger, SGHomeSection) {
   SGHomeSection1,
   SGHomeSection2
} ;

typedef NS_ENUM(NSInteger, SGHomeRow) {
   SGHomeRowLabel,
   SGHomeRowButton
} ;

@implementation SGHomeDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   SGBaseTableViewSection *section = self.sections[indexPath.section];
   SGBaseTableViewRow *row = section.rows[indexPath.row];
   return [self cellForSection:section row:row inTableView:tableView];
}

- (void)registerReusableViews:(UITableView *)tableView {
   [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGLabelCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SGLabelCell class])];
   [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SGButtonCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([SGButtonCell class])];
}

#pragma mark - Cells
- (UITableViewCell *)cellForSection:(SGBaseTableViewSection *)section row:(SGBaseTableViewRow *)row inTableView:(UITableView *)tableView {
   
   switch (section.type) {
      case SGHomeSection1: return [self labelCellForTableView:tableView];
      case SGHomeSection2: {
         switch (row.type) {
            case SGHomeRowLabel: return [self labelCellForTableView:tableView];
            case SGHomeRowButton: return [self buttonCellForTableView:tableView];
         }
      }
   }
   
   return nil;
}

- (SGLabelCell *)labelCellForTableView:(UITableView *)tableView {
   SGLabelCell *cell = (SGLabelCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SGLabelCell class])];
   cell.label.text = @"Test de typage des section et row de tableView";
   return cell;
}

- (SGButtonCell *)buttonCellForTableView:(UITableView *)tableView {
   SGButtonCell *cell = (SGButtonCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SGButtonCell class])];
   [cell.button setTitle:@"Action" forState:UIControlStateNormal];
   return cell;
}

+ (NSArray <SGBaseTableViewSection*> *)initialSections {
   
   // Section1
   SGBaseTableViewSection *section1 = [[SGBaseTableViewSection alloc] initWithType:SGHomeSection1];
   section1.state = SGTableViewSectionStateOpened;
   section1.rows = [self rowsForSection:section1];
   
   // Section2
   SGBaseTableViewSection *section2 = [[SGBaseTableViewSection alloc] initWithType:SGHomeSection2];
   section2.rows = [self rowsForSection:section2];

   return @[section1, section2];
}

+ (NSArray <SGBaseTableViewRow *> *)rowsForSection:(SGBaseTableViewSection *)section {
   switch (section.type) {
      case SGHomeSection1: {
         SGBaseTableViewRow *row1 = [[SGBaseTableViewRow alloc] initWithType:SGHomeRowLabel];
         SGBaseTableViewRow *row2 = [[SGBaseTableViewRow alloc] initWithType:SGHomeRowLabel];
         return @[row1, row2];
      }
      case SGHomeSection2: {
         SGBaseTableViewRow *row = [[SGBaseTableViewRow alloc] initWithType:SGHomeRowButton];
         return @[row];
      }
   }
   return @[];
}

#pragma mark - Header views
- (UIView *)headerViewForSectionType:(NSUInteger)sectionType {
   switch (sectionType) {
      case SGHomeSection1: return [SGHomeHeaderView loadView];
      default: return [[UIView alloc] initWithFrame:CGRectZero];
   }
}

@end
