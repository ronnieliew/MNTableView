//
//  MNTableViewCell.m
//  MNTableViewExample
//
//  Created by Ronnie Liew on 13/12/13.
//  Copyright (c) 2013 Monokromik. All rights reserved.
//

#import "MNTableViewCell.h"

@implementation MNTableViewCell

+ (NSString *)cellIdentifier {
    return NSStringFromClass([self class]);
}


+ (CGFloat)heightForTableView:(UITableView *)tableView withObject:(id)object {
    return 44.0;
}


- (void)configureWithObject:(id)object {
}

@end
