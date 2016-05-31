//
//  DHTPersistanceDatabasePool.m
//  EffetivePlan
//
//  Created by happyo on 16/5/31.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceDatabasePool.h"

@interface DHTPersistanceDatabasePool ()

@property (nonatomic, strong) NSMutableDictionary *databaseList;

@end
@implementation DHTPersistanceDatabasePool

+ (instancetype)sharedInstance
{
    static DHTPersistanceDatabasePool *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DHTPersistanceDatabasePool alloc] init];
    });
    
    return sharedInstance;
}

- (DHTPersistanceDataBase *)databaseWithName:(NSString *)databaseName
{
    if (!self.databaseList[databaseName]) {
        NSError *error = nil;
        DHTPersistanceDataBase *sharedDatabase = [[DHTPersistanceDataBase alloc] initWithDatabaseName:databaseName error:&error];
        if (error) {
            NSLog(@"Error at %s:[%d]:%@", __FILE__, __LINE__, error);
        } else {
            [self.databaseList setObject:sharedDatabase forKey:databaseName];
        }
    }
    
    return self.databaseList[databaseName];
}

- (void)closeAllDatabases
{
    [self.databaseList enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, DHTPersistanceDataBase * _Nonnull database, BOOL * _Nonnull stop) {
        if ([database isKindOfClass:[DHTPersistanceDataBase class]]) {
            [database closeDatabase];
        }
    }];
    
    [self.databaseList removeAllObjects];
}

- (void)closeDatabaseWithName:(NSString *)databaseName
{
    DHTPersistanceDataBase *database = self.databaseList[databaseName];
    [database closeDatabase];
    
    [self.databaseList removeObjectForKey:databaseName];
}

#pragma mark -- Getters && Setters --

- (NSMutableDictionary *)databaseList
{
    if (!_databaseList) {
        _databaseList = [NSMutableDictionary dictionary];
    }
    
    return _databaseList;
}

@end
