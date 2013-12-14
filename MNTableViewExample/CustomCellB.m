//
//  CustomCellB.m
//  MNTableViewExample
//
//  Created by Ronnie Liew on 14/12/13.
//  Copyright (c) 2013 Monokromik. All rights reserved.
//

#import "CustomCellB.h"

@implementation CustomCellB

- (void)configureWithObject:(id)object {
    self.textLabel.text = object[@"title"];
}


@end
