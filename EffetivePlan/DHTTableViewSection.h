//
//  DHTTableViewSection.h
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"

@interface DHTTableViewSection : NSObject

@property (nonatomic, readonly, strong) NSArray *items;

@property (nonatomic, strong) UIView *sectionHeaderView;

@property (nonatomic, strong) UIView *sectionFooterView;

- (void)addItem:(DHTTableViewItem *)item;

@end
