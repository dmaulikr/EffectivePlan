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
#import "DHTMediator+DHTMediatorPlanActions.h"

NSString * const kPlanListDataKeyTitle = @"title";
NSString * const kPlanListDataKeyDescription = @"description";
NSString * const kPlanListDataKeyCreatedDate = @"createdDate";


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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[DHTMediator sharedInstance] DHTMediator_showAddPlanViewController];
}

#pragma mark -- Private Methods --

- (NSDictionary *)reformData:(NSDictionary *)originData fromManager:(DHTAPIBaseManager *)manager
{
    NSDictionary *reformDict = nil;
    
    if ([manager isKindOfClass:[DHTGetPlanManager class]]) {
        reformDict = @{
            kPlanListDataKeyTitle : originData[@"title"],
            kPlanListDataKeyDescription :originData[@"description"],
            kPlanListDataKeyCreatedDate : originData[@"createdDate"]
        };
    }
    
    return reformDict;
}

#pragma mark -- DHTAPIManagerCallbackDataReformer --

- (id)manager:(DHTAPIBaseManager *)manager reformData:(NSDictionary *)data
{
    if ([manager isKindOfClass:[DHTGetPlanManager class]]) {
        NSArray *dataList = [data objectForKey:@"dataList"];
        NSMutableArray *reformDataList = [NSMutableArray array];
        
        for (NSDictionary *dict in dataList) {
            [reformDataList addObject:[self reformData:dict fromManager:manager]];
        }
        
        self.planList = reformDataList;
    }
    
    return nil;
}

#pragma mark -- Getters && Setters --

- (NSArray *)planList
{
    if (!_planList) {
        _planList = [NSArray array];
    }
    
    return _planList;
}

@end
