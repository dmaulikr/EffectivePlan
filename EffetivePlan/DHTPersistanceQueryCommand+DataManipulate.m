//
//  DHTPersistanceQueryCommand+DataManipulate.m
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceQueryCommand+DataManipulate.h"
#import "DHTPersistanceQueryCommand+ReadingManipulate.h"

@implementation DHTPersistanceQueryCommand (DataManipulate)

- (DHTPersistanceQueryCommand *)insertTable:(NSString *)tableName withDataList:(NSArray *)dataList
{
    [self resetQueryCommand];
    
    NSString *columnString = nil;
    NSMutableArray *valueItemList = [NSMutableArray array];
    
    for (int i = 0; i < dataList.count; i++) {
        NSDictionary *columnDict = dataList[i];
        NSMutableArray *columnNameList = [NSMutableArray array];
        NSMutableArray *columnValueList = [NSMutableArray array];
        
        [columnDict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull columnName, NSString * _Nonnull columnValue, BOOL * _Nonnull stop) {
            [columnNameList addObject:columnName];
            
            if ([columnValue isKindOfClass:[NSString class]]) {
                [columnValueList addObject:[NSString stringWithFormat:@"'%@'", columnValue]];
            } else if ([columnValue isKindOfClass:[NSNull class]]) {
                [columnValueList addObject:@"NULL"];
            } else {
                [columnValueList addObject:[NSString stringWithFormat:@"'%@'", columnValue]];
            }
        }];
        
        if (!columnString) {
            columnString = [columnNameList componentsJoinedByString:@","];
        }
        
        NSString *valueString = [columnValueList componentsJoinedByString:@","];
        [valueItemList addObject:[NSString stringWithFormat:@"(%@)", valueString]];
    }
    
    [self.sqlString appendFormat:@"INSERT INTO %@ (%@) VALUES %@;", tableName, columnString, [valueItemList componentsJoinedByString:@","]];
    
    return self;
}

- (DHTPersistanceQueryCommand *)updateTable:(NSString *)tableName withRecord:(NSDictionary *)record whereCondition:(NSString *)whereCondition
{
    [self resetQueryCommand];
    
    NSMutableArray *columnValueList = [NSMutableArray array];
    
    [record enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull columnName, NSString * _Nonnull columnValue, BOOL * _Nonnull stop) {
        if ([columnValue isKindOfClass:[NSString class]]) {
            [columnValueList addObject:[NSString stringWithFormat:@"%@ = '%@'", columnName, columnValue]];
        } else if ([columnValue isKindOfClass:[NSNull class]]) {
            [columnValueList addObject:[NSString stringWithFormat:@"%@ = NULL", columnName]];
        } else {
            [columnValueList addObject:[NSString stringWithFormat:@"%@ = '%@'", columnName, columnValue]];
        }
    }];
    
    NSString *valueString = [columnValueList componentsJoinedByString:@","];
    [self.sqlString appendFormat:@"UPDATE %@ SET %@", tableName, valueString];
    
    return [self where:whereCondition];
}

@end
