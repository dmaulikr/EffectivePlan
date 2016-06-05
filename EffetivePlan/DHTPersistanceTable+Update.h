//
//  DHTPersistanceTable+Update.h
//  EffetivePlan
//
//  Created by happyo on 16/6/5.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceTable.h"
#import "DHTPersistanceRecordProtocol.h"

@interface DHTPersistanceTable (Update)

- (BOOL)updateRecord:(NSObject <DHTPersistanceRecordProtocol> *)record error:(NSError **)error;

@end
