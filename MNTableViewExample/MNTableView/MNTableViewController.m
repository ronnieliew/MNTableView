//
//  MNTableViewController.m
//  MNTableViewExample
//
//  Created by Ronnie Liew on 13/12/13.
//  Copyright (c) 2013 Monokromik. All rights reserved.
//

#import "MNTableViewController.h"
#import "MNTableViewCell.h"

@interface MNTableViewController ()

@end

@implementation MNTableViewController


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Cell Configuration
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSDictionary *)cellConfigurationWithCellClass:(Class)cellClass forCellType:(NSString *)cellType {
    return @{MNTableViewCellClassKey: cellClass, MNTableViewCellTypeKey:cellType ?: [NSNull null]};
}


+ (NSDictionary *)cellConfigurationWithCellClass:(Class)cellClass {
    return [self cellConfigurationWithCellClass:cellClass forCellType:nil];
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UIViewController
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];

    NSInteger numberOfSections = self.tableView.numberOfSections;
    NSMutableArray *cellConfigurations = [NSMutableArray array];
    
    // 2-dimensional array to support multiple sections
    // To access section 0, self.cellConfiguration[0]
    for (NSInteger i=0 ; i<numberOfSections; i++) {
        [cellConfigurations addObject:[NSMutableArray array]];
    }
    
    self.cellConfigurations = cellConfigurations;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Assumption of table to have at least 1 section (convention over configuration)
    // This class uses this value to dynamically create the 2-dimensional cellConfiguration
    // Subclasses to override this if more than 1 section required.
    
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *cellConfiguration = [self cellConfigurationForIndexPath:indexPath];
    Class cellClass = cellConfiguration[MNTableViewCellClassKey];
    NSString *cellIdentifier = [cellClass performSelector:@selector(cellIdentifier)];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}



- (id)objectForIndexPath:(NSIndexPath *)indexPath {
    return nil;
}



- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    id object = [self objectForIndexPath:indexPath];
    
    [(MNTableViewCell *)cell configureWithObject:object];
    
}



- (NSDictionary *)cellConfigurationForIndexPath:(NSIndexPath *)indexPath {

    NSMutableArray *cellConfigurationsForSection = self.cellConfigurations[indexPath.section];
    NSDictionary *cellConfiguration = cellConfigurationsForSection[indexPath.row];

    return cellConfiguration;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDelegate
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *cellConfiguration = [self cellConfigurationForIndexPath:indexPath];
    Class cellClass = cellConfiguration[MNTableViewCellClassKey];
    id objectForCell = [self objectForIndexPath:indexPath];
    
    SEL selector = NSSelectorFromString(@"heightForTableView:withObject:");

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[cellClass methodSignatureForSelector:selector]];

    [invocation setSelector:selector];
    [invocation setTarget:cellClass];
    [invocation setArgument:&tableView atIndex:2];
    [invocation setArgument:&objectForCell atIndex:3];
    [invocation invoke];

    CGFloat height;
    [invocation getReturnValue:&height];
    
    return height;
}
@end
