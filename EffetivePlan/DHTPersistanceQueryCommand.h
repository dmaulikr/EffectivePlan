//
//  DHTPersistanceQueryCommand.h
//  EffetivePlan
//
//  Created by happyo on 16/5/31.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTPersistanceDatabasePool.h"

@interface DHTPersistanceQueryCommand : NSObject

@property (nonatomic, strong, readonly) NSMutableString *sqlString;

- (instancetype)initWithDatabase:(DHTPersistanceDataBase *)database;

- (instancetype)initWithDatabaseName:(NSString *)databaseName;

- (BOOL)excuteWithError:(NSError **)error;

- (NSArray *)fetchWithError:(NSError **)error;

- (DHTPersistanceQueryCommand *)resetQueryCommand;

@end
