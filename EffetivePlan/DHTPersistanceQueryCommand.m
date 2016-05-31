//
//  DHTPersistanceQueryCommand.m
//  EffetivePlan
//
//  Created by happyo on 16/5/31.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceQueryCommand.h"
#import "DHTPersistanceDataBase.h"
#import "DHTPersistanceConfiguration.h"

@interface DHTPersistanceQueryCommand ()

@property (nonatomic, weak) DHTPersistanceDataBase *database;

@property (nonatomic, copy) NSString *databaseName;

@property (nonatomic, copy) NSString *sqlString;

@end
@implementation DHTPersistanceQueryCommand

- (BOOL)excuteWithError:(NSError *__autoreleasing *)error
{
    const char *sql = [[NSString stringWithFormat:@"%@;", self.sqlString] UTF8String];
    char *errmsg = NULL;
    sqlite3_exec(self.database.database, sql, NULL, NULL, &errmsg);
    
    if (errmsg) {
        NSString *errorString = [NSString stringWithFormat:@"Query Error: \n query string : %@ \n error message : %@ \n", self.sqlString, [NSString stringWithUTF8String:errmsg]];
        *error = [NSError errorWithDomain:kDHTPersistanceErrorDomain code:DHTPersistanceErrorCodeQueryStringError userInfo:@{NSLocalizedDescriptionKey:errorString}];
        
        return NO;
    }
    
    return YES;
}

- (NSArray *)fetchWithError:(NSError *__autoreleasing *)error
{
    NSMutableArray *resultsArray = [NSMutableArray array];
    const char *sql = [[NSString stringWithFormat:@"%@;", self.sqlString] UTF8String];
    
    sqlite3_stmt *statement;
    
    int result = sqlite3_prepare_v2(self.database.database, sql, -1, &statement, NULL);
    
    if (result != SQLITE_OK) {
        const char *errmsg = sqlite3_errmsg(self.database.database);
        NSString *errorString = [NSString stringWithFormat:@"Query Error: \n query string : %@ \n error message : %@ \n", self.sqlString, [NSString stringWithUTF8String:errmsg]];
        *error = [NSError errorWithDomain:kDHTPersistanceErrorDomain code:DHTPersistanceErrorCodeQueryStringError userInfo:@{NSLocalizedDescriptionKey:errorString}];
        
        return resultsArray;
    }
    
    while (sqlite3_step(statement) == SQLITE_ROW) {
        int columnsCount = sqlite3_column_count(statement);
        NSMutableDictionary *rowResult = [NSMutableDictionary dictionary];
        
        for (int i = 0; i < columnsCount; i++) {
            const char *name = sqlite3_column_name(statement, i);
            NSString *columnName = [NSString stringWithUTF8String:name];
            
            int type = sqlite3_column_type(statement, i);
            
            switch (type) {
                case SQLITE_INTEGER:{
                    int64_t value = sqlite3_column_int64(statement, i);
                    [rowResult setObject:@(value) forKey:columnName];
                    
                    break;
                }
                case SQLITE_FLOAT:{
                    double value = sqlite3_column_double(statement, i);
                    [rowResult setObject:@(value) forKey:columnName];
                    
                    break;
                }
                case SQLITE_BLOB:{
                    int bytes = sqlite3_column_bytes(statement, i);
                    if (bytes > 0) {
                        const void *blob = sqlite3_column_blob(statement, i);
                        
                        if (blob != NULL) {
                            [rowResult setObject:[NSData dataWithBytes:blob length:bytes] forKey:columnName];
                        }
                    }
                    
                    break;
                }
                case SQLITE_TEXT:{
                    const char *value = (const char *)sqlite3_column_text(statement, i);
                    [rowResult setObject:[NSString stringWithUTF8String:value] forKey:columnName];
                    
                    break;
                }
                case SQLITE_NULL:{
                    [rowResult setObject:[NSNull null] forKey:columnName];
                    
                    break;
                }
                    
                default:{
                    const char *value = (const char *)sqlite3_column_text(statement, i);
                    [rowResult setObject:[NSString stringWithUTF8String:value] forKey:columnName];
                    
                    break;
                }
            }
            [resultsArray addObject:rowResult];
        }
    }
    sqlite3_finalize(statement);
    
    return resultsArray;
}

@end
