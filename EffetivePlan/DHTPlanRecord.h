//
//  DHTPlanRecord.h
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTPersistanceRecordProtocol.h"
#import "DHTPlanListReformerKeys.h"

@interface DHTPlanRecord : NSObject <DHTPersistanceRecordProtocol>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *planDescription;

@property (nonatomic, copy) NSString *createDate;

- (NSDictionary *)transtromToNormalData;

@end
