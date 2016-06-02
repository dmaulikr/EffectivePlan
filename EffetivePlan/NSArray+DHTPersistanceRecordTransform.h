//
//  NSArray+DHTPersistanceRecordTransform.h
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTPersistanceRecordProtocol.h"

@interface NSArray (DHTPersistanceRecordTransform)

- (NSArray *)transfromSqlItemToRecordClass:(Class<DHTPersistanceRecordProtocol>)recordClass;

@end
