
//  Created by samir on 28/04/2017.
//  Copyright © 2017 Samir Guerdah. All rights reserved.

#import "ViewController.h"

#import "SGHomeDataSource.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SGHomeDataSource *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
   [super viewDidLoad];
   
   self.tableView.estimatedRowHeight = 200;
   self.tableView.rowHeight = UITableViewAutomaticDimension;
   
   self.dataSource = [[SGHomeDataSource alloc] init];
   self.dataSource.sections = [SGHomeDataSource initialSections];
   [self.dataSource registerReusableViews:self.tableView];
   self.tableView.dataSource = self.dataSource;
}

@end
