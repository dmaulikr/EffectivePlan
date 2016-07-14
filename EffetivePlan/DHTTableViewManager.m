//
//  DHTTableViewManager.m
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTTableViewManager.h"
#import "DHTTableViewSection.h"

@interface DHTTableViewManager () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *mutableSections;

@property (nonatomic, strong) NSMutableDictionary *registerCells;

@end
@implementation DHTTableViewManager

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        tableView.delegate = self;
        tableView.dataSource = self;
        self.tableView = tableView;
    }
    
    return self;
}

#pragma mark -- Public Methods --

- (void)registerCell:(NSString *)cellString withItem:(NSString *)itemString
{
    self.registerCells[itemString] = cellString;
}

- (void)addSection:(DHTTableViewSection *)section
{
    [self.mutableSections addObject:section];
}

#pragma mark -- Private Methods --

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    DHTTableViewItem *item = [self itemAtIndexPath:indexPath];
    
    NSString *cellString = self.registerCells[NSStringFromClass(item.class)];
    
    Class cellClass = NSClassFromString(cellString);
    
    return cellClass;
}

- (DHTTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath
{
    DHTTableViewSection *section = self.mutableSections[indexPath.section];
    DHTTableViewItem *item = section.items[indexPath.row];
    
    return item;
}

#pragma mark -- UITableViewDataSource --

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.mutableSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DHTTableViewSection *tableSection = self.mutableSections[section];
    NSInteger numOfRows = tableSection.items.count;
    
    return numOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self classForCellAtIndexPath:indexPath];
    NSString *cellIdentifier = [NSString stringWithUTF8String:object_getClassName(cellClass)];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if ([cell respondsToSelector:@selector(cellDidLoad)]) {
        [cell performSelector:@selector(cellDidLoad)];
    }
    
    if ([cell respondsToSelector:@selector(configCellWithItem:)]) {
        [cell performSelector:@selector(configCellWithItem:) withObject:[self itemAtIndexPath:indexPath]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = 0;
    Class cellClass = [self classForCellAtIndexPath:indexPath];
    
    if ([cellClass conformsToProtocol:@protocol(DHTTableViewCellDelegate)]) {
        cellHeight = [cellClass heightForCellWithItem:[self itemAtIndexPath:indexPath]];
    }
    
    return cellHeight;
}


#pragma mark -- UITableViewDelegate --


#pragma mark -- Setters && Getters --

- (NSArray *)sections
{
    return self.mutableSections;
}

- (NSMutableArray *)mutableSections
{
    if (!_mutableSections) {
        _mutableSections = [NSMutableArray array];
    }
    
    return _mutableSections;
}

- (NSMutableDictionary *)registerCells
{
    if (!_registerCells) {
        _registerCells = [NSMutableDictionary dictionary];
    }
    
    return _registerCells;
}


@end
