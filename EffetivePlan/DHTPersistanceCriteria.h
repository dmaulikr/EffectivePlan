//
//  DHTPersistanceCriteria.h
//  EffetivePlan
//
//  Created by happyo on 16/6/2.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHTPersistanceCriteria : NSObject

@property (nonatomic, copy) NSString *selectedColumns;

@property (nonatomic, copy) NSString *whereCondition;

@property (nonatomic, assign) BOOL isDisctinct;

@property (nonatomic, assign) BOOL isDESC;

@end
