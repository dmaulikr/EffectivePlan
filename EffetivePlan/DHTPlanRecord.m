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
             @"title" : @"hello",
             @"description" : @"world"
             };
}

@end
