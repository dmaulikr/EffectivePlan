//
//  DHTTableViewSection.m
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTTableViewSection.h"

@interface DHTTableViewSection ()

@property (nonatomic, readwrite, strong) NSMutableArray *mutableItems;

@end
@implementation DHTTableViewSection

- (void)addItem:(DHTTableViewItem *)item
{
    [self.mutableItems addObject:item];
}

- (NSArray *)items
{
    return self.mutableItems;
}

- (NSMutableArray *)mutableItems
{
    if (!_mutableItems) {
        _mutableItems = [NSMutableArray array];
    }
    
    return _mutableItems;
}

@end
