//
//  DHTPersistanceQueryCommand+SchemaManipulate.h
//  EffetivePlan
//
//  Created by happyo on 16/6/1.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceQueryCommand.h"

@interface DHTPersistanceQueryCommand (SchemaManipulate)

- (DHTPersistanceQueryCommand *)createTableWithName:(NSString *)tableName columns:(NSDictionary *)columnInfo;

@end
