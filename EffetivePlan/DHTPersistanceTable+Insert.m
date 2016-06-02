//
//  DHTPersistanceTable+Insert.m
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceTable+Insert.h"
#import "DHTPersistanceQueryCommand+DataManipulate.h"

@implementation DHTPersistanceTable (Insert)

- (BOOL)insertRecord:(NSObject<DHTPersistanceRecordProtocol> *)record error:(NSError *__autoreleasing *)error
{
    DHTPersistanceQueryCommand *queryCommand = [[DHTPersistanceQueryCommand alloc] initWithDatabaseName:[self.child databaseName]];
    
    if ([[queryCommand insertTable:[self.child tableName] withDataList:@[[record dictionaryRepresentationWithTable:self.child]]] excuteWithError:error]) {
        return YES;
    }
    
    return NO;
}

@end
