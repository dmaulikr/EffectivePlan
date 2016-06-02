//
//  NSArray+DHTPersistanceRecordTransform.m
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "NSArray+DHTPersistanceRecordTransform.h"

@implementation NSArray (DHTPersistanceRecordTransform)

- (NSArray *)transfromSqlItemToRecordClass:(Class)recordClass
{
    NSMutableArray *recordsList = [NSMutableArray array];
    
    for (int i = 0; i < self.count; i++) {
        id <DHTPersistanceRecordProtocol> record = [[recordClass alloc] init];
        if ([record respondsToSelector:@selector(objectRepresentationWithDictionary:)]) {
            NSDictionary *dict = self[i];
            [record objectRepresentationWithDictionary:dict];
            [recordsList addObject:record];
        }
    }
    
    return recordsList;
}

@end
