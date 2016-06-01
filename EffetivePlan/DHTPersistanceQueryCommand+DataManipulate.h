//
//  DHTPersistanceQueryCommand+DataManipulate.h
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceQueryCommand.h"

@interface DHTPersistanceQueryCommand (DataManipulate)

- (DHTPersistanceQueryCommand *)insertTable:(NSString *)tableName withDataList:(NSArray *)dataList;

@end
