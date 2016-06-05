//
//  DHTPersistanceTable+Find.h
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceTable.h"
#import "DHTPersistanceRecordProtocol.h"
#import "DHTPersistanceCriteria.h"

@interface DHTPersistanceTable (Find)

- (NSArray <NSObject <DHTPersistanceRecordProtocol> *> *)findAllWithWhereCondition:(NSString *)whereCondition isDistinct:(BOOL)isDistinct error:(NSError **)error;

- (NSArray <NSObject <DHTPersistanceRecordProtocol> *> *)findAllWithCriteria:(DHTPersistanceCriteria *)criteria error:(NSError **)error;

- (NSObject <DHTPersistanceRecordProtocol> *)findWithPrimaryKey:(NSString *)primaryKey error:(NSError **)error;

@end
