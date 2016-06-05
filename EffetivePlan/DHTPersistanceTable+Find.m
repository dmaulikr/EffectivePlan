//
//  DHTPersistanceTable+Find.m
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceTable+Find.h"
#import "DHTPersistanceQueryCommand+ReadingManipulate.h"
#import "NSArray+DHTPersistanceRecordTransform.h"

@implementation DHTPersistanceTable (Find)

- (NSArray<NSObject<DHTPersistanceRecordProtocol> *> *)findAllWithWhereCondition:(NSString *)whereCondition isDistinct:(BOOL)isDistinct error:(NSError *__autoreleasing *)error
{
    DHTPersistanceCriteria *criteria = [[DHTPersistanceCriteria alloc] init];
    criteria.whereCondition = whereCondition;
    criteria.isDisctinct = isDistinct;
    
    return [self findAllWithCriteria:criteria error:error];
}

- (NSArray<NSObject<DHTPersistanceRecordProtocol> *> *)findAllWithCriteria:(DHTPersistanceCriteria *)criteria error:(NSError *__autoreleasing *)error
{
    DHTPersistanceQueryCommand *queryCommand = [[DHTPersistanceQueryCommand alloc] initWithDatabaseName:[self.child databaseName]];
    
    [queryCommand select:criteria.selectedColumns isDistinct:criteria.isDisctinct];
    [queryCommand from:[self.child tableName]];
    [queryCommand where:criteria.whereCondition];
    
    return [[queryCommand fetchWithError:error] transfromSqlItemToRecordClass:[self.child recordClass]];
}

- (NSObject<DHTPersistanceRecordProtocol> *)findWithPrimaryKey:(NSString *)primaryKey error:(NSError *__autoreleasing *)error
{
    NSString *whereCondition = [NSString stringWithFormat:@" %@ = '%@'", [self.child primaryKeyName], primaryKey];
    
    return [self findAllWithWhereCondition:whereCondition isDistinct:NO error:error].firstObject;
}

@end
