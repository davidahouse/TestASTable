//
//  TestTableViewController.m
//  TestASTable
//
//  Created by David House on 6/6/14.
//  Copyright (c) 2014 Random Accident. All rights reserved.
//

#import "TestTableViewController.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    // NOTE: Setting the rowHeight to Automatic causes the Font attribute
    // on the Attributed String in the Cell textLabel to not work. Assigning
    // a fixed rowHeight to the table causes it to work correctly.
    //
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIFont *font = [UIFont fontWithName:@"MarkerFelt-Thin" size:14.0];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font
                                     
                                                                forKey:NSFontAttributeName];
    
    NSMutableAttributedString *testString = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"first line" attributes:attrsDictionary];
    
    [testString appendAttributedString:attrString];
    
    cell.textLabel.attributedText = testString;
    return cell;
}

- (IBAction)changeRowHeight:(id)sender {
    
    if ( self.tableView.rowHeight == UITableViewAutomaticDimension ) {
        self.tableView.rowHeight = 50;
    }
    else {
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    }
    [self.tableView reloadData];
}

@end
