//
//  DHTPersistanceDataBase.h
//  EffetivePlan
//
//  Created by happyo on 16/5/30.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DHTPersistanceDataBase : NSObject

@property (nonatomic, assign, readonly) sqlite3 *database;

@property (nonatomic, copy, readonly) NSString *databaseName;

@property (nonatomic, copy, readonly) NSString *databaseFilePath;

- (instancetype)initWithDatabaseName:(NSString *)databaseName error:(NSError **)error;

- (void)closeDatabase;

@end
