//
//  ViewController.m
//  MNTableViewExample
//
//  Created by Ronnie Liew on 14/12/13.
//  Copyright (c) 2013 Monokromik. All rights reserved.
//

#import "ViewController.h"
#import "CustomCellA.h"
#import "CustomCellB.h"

@interface ViewController ()
@property (nonatomic, strong)NSArray *model;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = @[@{@"title":@"Sheldon Cooper", @"subtitle":@"A child prodigy with an eidetic memory"},
                   @{@"title":@"Leonard Hofstadter"},
                   @{@"title":@"Rajesh Ramayan \"Raj\" Koothrappali", @"subtitle":@"Originally from New Delhi, India, he works as a particle astrophysicist at Caltech."},
                   @{@"title":@"Howard Joel Wolowitz"},];
    
    NSInteger numberOfRows = [self tableView:self.tableView numberOfRowsInSection:0];
    
    for (NSInteger i=0; i<numberOfRows; i++) {
        if (i%2==0) self.cellConfigurations[0][i] = [MNTableViewController cellConfigurationWithCellClass:[CustomCellA class]];
        else self.cellConfigurations[0][i] = [MNTableViewController cellConfigurationWithCellClass:[CustomCellB class]];
        
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}




- (id)objectForIndexPath:(NSIndexPath *)indexPath {
    return self.model[indexPath.row];
}


@end
