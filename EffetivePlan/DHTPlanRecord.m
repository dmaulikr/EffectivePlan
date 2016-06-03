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
             @"create_date" : self.createDate
             };
}

- (void)objectRepresentationWithDictionary:(NSDictionary *)dict
{
    self.title = [dict objectForKey:@"title"];
    
    self.planDescription = [dict objectForKey:@"description"];
    
    self.createDate = [dict objectForKey:@"create_date"];
}

- (NSDictionary *)transtromToNormalData
{
    return @{
             kPlanListDataKeyTitle : self.title,
             kPlanListDataKeyDescription : self.planDescription,
             kPlanListDataKeyCreatedDate : self.createDate
             };
}

@end
