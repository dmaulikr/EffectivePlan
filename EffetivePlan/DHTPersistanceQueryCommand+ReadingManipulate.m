//
//  DHTPersistanceQueryCommand+ReadingManipulate.m
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceQueryCommand+ReadingManipulate.h"

@implementation DHTPersistanceQueryCommand (ReadingManipulate)

- (DHTPersistanceQueryCommand *)select:(NSString *)selectedColumns isDistinct:(BOOL)isDistinct
{
    [self resetQueryCommand];
    
    NSString *distinct = isDistinct ? @"DISTINCT" : @"";
    if (!selectedColumns) {
        [self.sqlString appendFormat:@"SELECT %@ * ", distinct];
    } else {
        [self.sqlString appendFormat:@"SELECT %@ %@ ", distinct, selectedColumns];
    }
    
    return self;
}

- (DHTPersistanceQueryCommand *)from:(NSString *)fromList
{
    if (!fromList) {
        return self;
    }
    
    [self.sqlString appendFormat:@"FROM %@ ", fromList];
    
    return self;
}

- (DHTPersistanceQueryCommand *)where:(NSString *)whereCondition
{
    if (!whereCondition) {
        return self;
    }
    
    [self.sqlString appendFormat:@"WHERE %@ ", whereCondition];
    
    return self;
}

@end
