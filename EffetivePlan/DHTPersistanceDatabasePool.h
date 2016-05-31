//
//  DHTPersistanceDatabasePool.h
//  EffetivePlan
//
//  Created by happyo on 16/5/31.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTPersistanceDataBase.h"

@interface DHTPersistanceDatabasePool : NSObject

+ (instancetype)sharedInstance;

- (DHTPersistanceDataBase *)databaseWithName:(NSString *)databaseName;

- (void)closeAllDatabases;

- (void)closeDatabaseWithName:(NSString *)databaseName;

@end
