
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.

#import "ViewController.h"

#import "SGHomeDataSource.h"
#import "SGBaseTableViewSection.h"

@interface ViewController () <UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SGHomeDataSource *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   
   self.tableView.estimatedRowHeight = 200;
   self.tableView.rowHeight = UITableViewAutomaticDimension;
   
   self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
   self.tableView.estimatedSectionHeaderHeight = 40;
   
   self.dataSource = [[SGHomeDataSource alloc] init];
   self.dataSource.sections = [SGHomeDataSource initialSections];
   [self.dataSource registerReusableViews:self.tableView];
   self.tableView.dataSource = self.dataSource;
   self.tableView.delegate = self;
}

#pragma mark - UITableViewDelegate methods
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   UIView *headerView =  [self.dataSource headerViewForSectionType:section];
   headerView.translatesAutoresizingMaskIntoConstraints = true;
   UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSectionAction:)];
   [headerView addGestureRecognizer:tapGesture];
   headerView.tag = section;
   return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
   return UITableViewAutomaticDimension;
}

#pragma mark - User actions
- (void)tapSectionAction:(UIGestureRecognizer *)gesture {
   NSUInteger sectionType = gesture.view.tag;
   [self.dataSource toggleSectionType:sectionType forTableView:self.tableView];
}

@end
