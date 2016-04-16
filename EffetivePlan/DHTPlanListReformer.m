//
//  DHTPlanListReformer.m
//  EffetivePlan
//
//  Created by happyo on 16/4/16.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPlanListReformer.h"
#import "DHTPlanCell.h"
#import "DHTGetPlanManager.h"
#import "APPMacro.h"

static NSString *kPlanCellIdentifier = @"DHTPlanCell";

@interface DHTPlanListReformer ()

@property (nonatomic, strong) NSArray *planList;

@end
@implementation DHTPlanListReformer

#pragma mark -- UITableViewDataSource --

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.planList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHTPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlanCellIdentifier];
    
    if (!cell) {
        cell = (DHTPlanCell *)CREAT_XIB(kPlanCellIdentifier);
    }
    
    NSDictionary *dict = self.planList[indexPath.row];
    [cell configureCellWithData:dict];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark -- DHTAPIManagerCallbackDataReformer --

- (id)manager:(DHTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    if ([manager isKindOfClass:[DHTGetPlanManager class]]) {
        self.planList = [data objectForKey:@"dataList"];
        
        return self.planList;
    }
    
    return nil;
}


- (NSArray *)planList
{
    if (!_planList) {
        _planList = [NSArray array];
    }
    
    return _planList;
}

@end
