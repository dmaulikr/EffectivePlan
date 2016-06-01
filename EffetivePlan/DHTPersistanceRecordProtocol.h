//
//  DHTPersistanceRecordProtocol.h
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#ifndef DHTPersistanceRecordProtocol_h
#define DHTPersistanceRecordProtocol_h
#import <Foundation/Foundation.h>
#import "DHTPersistanceTable.h"

@protocol DHTPersistanceRecordProtocol <NSObject>

@required
- (NSDictionary *)dictionaryRepresentationWithTable:(DHTPersistanceTable <DHTPersistanceTableProtocol> *)table;

@end

#endif /* DHTPersistanceRecordProtocol_h */
