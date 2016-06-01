//
//  DHTPersistanceQueryCommand+SchemaManipulate.m
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceQueryCommand+SchemaManipulate.h"

@implementation DHTPersistanceQueryCommand (SchemaManipulate)

- (DHTPersistanceQueryCommand *)createTableWithName:(NSString *)tableName columns:(NSDictionary *)columnInfo
{
    [self resetQueryCommand];

    NSMutableArray *columnsArray = [NSMutableArray array];
    
    [columnInfo enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull columnName, NSString * _Nonnull columnDescription, BOOL * _Nonnull stop) {
        [columnsArray addObject:[NSString stringWithFormat:@"%@ %@", columnName, columnDescription]];
    }];
    
    NSString *columnsString = [columnsArray componentsJoinedByString:@","];
    
    [self.sqlString appendFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@);", tableName, columnsString];
    
    return self;
}



@end
