//
//  DHTPersistanceDataBase.m
//  EffetivePlan
//
//  Created by happyo on 16/5/30.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceDataBase.h"
#import "DHTPersistanceConfiguration.h"


@interface DHTPersistanceDataBase ()

@property (nonatomic, assign) sqlite3 *database;

@property (nonatomic, copy) NSString *databaseName;

@property (nonatomic, copy) NSString *databaseFilePath;

@end
@implementation DHTPersistanceDataBase

- (instancetype)initWithDatabaseName:(NSString *)databaseName error:(NSError *__autoreleasing *)error
{
    self = [super init];
    
    if (self) {
        //
        self.databaseName = databaseName;
        self.databaseFilePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:databaseName];
        
        int result = sqlite3_open(self.databaseFilePath.UTF8String, &_database);
        
        BOOL isFileExists = [[NSFileManager defaultManager] fileExistsAtPath:self.databaseFilePath];
        
        if (result != SQLITE_OK) {
            // 打开数据库失败
            DHTPersistanceErrorCode errorCode = DHTPersistanceErrorCodeOpenError;
            NSString *sqliteErrorString = [NSString stringWithCString:sqlite3_errmsg(self.database) encoding:NSUTF8StringEncoding];
            NSString *errorString = [NSString stringWithFormat:@"open database failed at %@ with error:\n %@", self.databaseFilePath, sqliteErrorString];
            
            if (isFileExists) {
                errorCode = DHTPersistanceErrorCodeCreateError;
                errorString = [NSString stringWithFormat:@"create database failed at %@ with error:\n %@", self.databaseFilePath, sqliteErrorString];
            }
            *error = [NSError errorWithDomain:kDHTPersistanceErrorDomain code:errorCode userInfo:@{NSLocalizedDescriptionKey:errorString}];
            
            return nil;
        }
    }
    
    return self;
}

@end
