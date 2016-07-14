//
//  DHTTestViewController.m
//  EffetivePlan
//
//  Created by happyo on 16/7/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTTestViewController.h"
#import "DHTTableViewManager.h"
#import "DHTTestItem.h"
#import "DHTTableViewSection.h"

@interface DHTTestViewController () <DHTNavBarButtonDelegate>

@property (nonatomic, strong) UITableView *tbvTest;

@property (nonatomic, strong) DHTTableViewManager *manager;

@end
@implementation DHTTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setRightNavBarButtonWithType:NavBarButtonDone];
    self.navDelegate = self;
    
    self.tbvTest = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tbvTest.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tbvTest];
    
    self.manager = [[DHTTableViewManager alloc] initWithTableView:self.tbvTest];
    
    [self.manager registerCell:@"DHTTestCell" withItem:@"DHTTestItem"];
    
    DHTTableViewSection *section = [[DHTTableViewSection alloc] init];
    
    DHTTestItem *item = [[DHTTestItem alloc] init];
    item.title = @"hahah";
    
    [section addItem:item];
    [self.manager addSection:section];
    
}


- (void)rightButtonIsTouched
{
    DHTTableViewSection *seciton = self.manager.sections[0];
    DHTTestItem *testItem = seciton.items[0];
    
    NSLog(@"%@", testItem.textValue);
}

@end
