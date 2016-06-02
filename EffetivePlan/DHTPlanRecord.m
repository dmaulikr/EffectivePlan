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
             @"title" : self.title ? self.title : @"test title",
             @"description" : self.planDescription ? self.planDescription : @"dec test"
             };
}

- (void)objectRepresentationWithDictionary:(NSDictionary *)dict
{
    self.title = [dict objectForKey:@"title"];
    
    self.planDescription = [dict objectForKey:@"description"];
}

@end
