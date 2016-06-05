//
//  DHTPlanRecord.m
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPlanRecord.h"

@implementation DHTPlanRecord

- (NSDictionary *)dictionaryRepresentationWithTable:(DHTPersistanceTable<DHTPersistanceTableProtocol> *)table
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.primaryKey forKey:@"id"];
    [dict setObject:self.title forKey:@"title"];
    [dict setObject:self.planDescription forKey:@"description"];
    [dict setObject:self.createdDate forKey:@"create_date"];
    
    return dict;
}

- (void)objectRepresentationWithDictionary:(NSDictionary *)dict
{
    self.title = [dict objectForKey:@"title"];
    
    self.planDescription = [dict objectForKey:@"description"];
    
    self.createdDate = [dict objectForKey:@"create_date"];
    
    self.primaryKey = [dict objectForKey:@"id"];
}

- (NSDictionary *)transtromToNormalData
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.title forKey:kPlanListDataKeyTitle];
    [dict setObject:self.planDescription forKey:kPlanListDataKeyDescription];
    [dict setObject:self.createdDate forKey:kPlanListDataKeyCreatedDate];
    [dict setObject:self.primaryKey forKey:@"primaryKey"];
    
    return dict;
}

#pragma mark -- Getters && Setters --

- (NSString *)title
{
    if (!_title) {
        _title = [[NSString alloc] init];
    }
    
    return _title;
}

- (NSString *)planDescription
{
    if (!_planDescription) {
        _planDescription = [[NSString alloc] init];
    }
    
    return _planDescription;
}

- (NSString *)createdDate
{
    if (!_createdDate) {
        _createdDate = [[NSString alloc] init];
    }
    
    return _createdDate;
}

@end
