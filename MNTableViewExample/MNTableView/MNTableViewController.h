//
//  MNTableViewController.h
//  MNTableViewExample
//
//  Created by Ronnie Liew on 13/12/13.
//  Copyright (c) 2013 Monokromik. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString * const MNTableViewCellTypeKey       = @"MNTableViewCellTypeKey";
static NSString * const MNTableViewCellClassKey      = @"MNTableViewCellClassKey";

@interface MNTableViewController : UITableViewController
+ (NSDictionary *)cellConfigurationWithCellClass:(Class)cellClass;
+ (NSDictionary *)cellConfigurationWithCellClass:(Class)cellClass forCellType:(NSString *)cellType;
@property (nonatomic, strong)NSMutableArray *cellConfigurations;
@end
