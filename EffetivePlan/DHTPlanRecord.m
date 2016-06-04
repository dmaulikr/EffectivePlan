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
    return @{
             @"title" : self.title,
             @"description" : self.planDescription,
             @"create_date" : self.createdDate
             };
}

- (void)objectRepresentationWithDictionary:(NSDictionary *)dict
{
    self.title = [dict objectForKey:@"title"];
    
    self.planDescription = [dict objectForKey:@"description"];
    
    self.createdDate = [dict objectForKey:@"create_date"];
}

- (NSDictionary *)transtromToNormalData
{
    return @{
             kPlanListDataKeyTitle : self.title,
             kPlanListDataKeyDescription : self.planDescription,
             kPlanListDataKeyCreatedDate : self.createdDate
             };
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
