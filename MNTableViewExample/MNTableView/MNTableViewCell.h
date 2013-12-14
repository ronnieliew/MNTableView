//
//  MNTableViewCell.h
//  MNTableViewExample
//
//  Created by Ronnie Liew on 13/12/13.
//  Copyright (c) 2013 Monokromik. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MNTableViewCell : UITableViewCell
+ (NSString *)cellIdentifier;
+ (CGFloat)heightForTableView:(UITableView *)tableView withObject:(id)object;

- (void)configureWithObject:(id)object;
@end
