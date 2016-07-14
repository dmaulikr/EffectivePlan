//
//  DHTTableViewManager.h
//  EffetivePlan
//
//  Created by happyo on 16/7/12.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTTableViewItem.h"
#import "DHTTableViewCellProtocol.h"
#import "DHTTableViewSection.h"

@interface DHTTableViewManager : NSObject

@property (strong, readonly, nonatomic) NSArray *sections;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)registerCell:(NSString *)cellString withItem:(NSString *)itemString;

- (void)addSection:(DHTTableViewSection *)section;

@end


