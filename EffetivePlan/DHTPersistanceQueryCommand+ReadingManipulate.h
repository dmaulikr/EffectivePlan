//
//  DHTPersistanceQueryCommand+ReadingManipulate.h
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceQueryCommand.h"

@interface DHTPersistanceQueryCommand (ReadingManipulate)

- (DHTPersistanceQueryCommand *)select:(NSString *)selectedColumns isDistinct:(BOOL)isDistinct;

- (DHTPersistanceQueryCommand *)from:(NSString *)fromList;

- (DHTPersistanceQueryCommand *)where:(NSString *)whereCondition;

@end
