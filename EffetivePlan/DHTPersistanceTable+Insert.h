//
//  DHTPersistanceTable+Insert.h
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTPersistanceTable.h"
#import "DHTPersistanceRecordProtocol.h"

@interface DHTPersistanceTable (Insert)

- (BOOL)insertRecord:(NSObject <DHTPersistanceRecordProtocol> *)record error:(NSError **)error;

@end
