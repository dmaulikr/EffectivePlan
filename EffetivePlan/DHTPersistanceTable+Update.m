//
//  DHTPersistanceTable+Update.m
//  EffetivePlan
//
//  Created by happyo on 16/6/5.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceTable+Update.h"
#import "DHTPersistanceQueryCommand+DataManipulate.h"

@implementation DHTPersistanceTable (Update)

- (BOOL)updateRecord:(NSObject<DHTPersistanceRecordProtocol> *)record error:(NSError *__autoreleasing *)error
{
    NSDictionary *recordDict = [record dictionaryRepresentationWithTable:self.child];
    NSString *primaryKey = [self.child primaryKeyName];
    NSString *whereCondition = [NSString stringWithFormat:@"%@ = '%@'", primaryKey, recordDict[primaryKey]];
    
    return [self updateRecord:record whereConditon:whereCondition error:error];
}

- (BOOL)updateRecord:(NSObject<DHTPersistanceRecordProtocol> *)record whereConditon:(NSString *)whereCondition error:(NSError *__autoreleasing *)error
{
    DHTPersistanceQueryCommand *queryCommand = [[DHTPersistanceQueryCommand alloc] initWithDatabaseName:[self.child databaseName]];
    
    return [[queryCommand updateTable:[self.child tableName] withRecord:[record dictionaryRepresentationWithTable:self.child] whereCondition:whereCondition] excuteWithError:error];
}

@end
