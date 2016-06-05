//
//  DHTPlanTable.m
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPlanTable.h"
#import "DHTPlanRecord.h"

@implementation DHTPlanTable

- (NSString *)databaseName
{
    return kDatabaseName;
}

- (NSString *)tableName
{
    return @"Plan_Info";
}

- (NSDictionary *)columnInfo
{
    return @{
             @"id" : @"INTEGER PRIMARY KEY AUTOINCREMENT",
             @"title" : @"TEXT",
             @"description" : @"TEXT",
             @"create_date" : @"TEXT",
             @"end_date" : @"TEXT",
             @"status" : @"INTEGER",
             };
}

- (Class)recordClass
{
    return [DHTPlanRecord class];
}

- (NSString *)primaryKeyName
{
    return @"id";
}

@end
