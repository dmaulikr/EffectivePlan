//
//  DHTPersistanceTable.h
//  EffetivePlan
//
//  Created by happyo on 16/5/30.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DHTPersistanceTableProtocol <NSObject>

@required

- (NSString *)databaseName;

- (NSString *)tableName;

- (NSDictionary *)columnInfo;

@end

@interface DHTPersistanceTable : NSObject

@property (nonatomic, weak, readonly) id<DHTPersistanceTableProtocol> child;

@end
