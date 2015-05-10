//
//  DHTPlanStore.h
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTPlan.h"

@interface DHTPlanStore : NSObject

@property (nonatomic, strong) NSMutableArray *planList;

+ (instancetype)sharedStore;

- (NSArray *)allPlans;

- (DHTPlan *)planAtIndex:(NSInteger) index;

- (void)insertPlan:(DHTPlan *)plan;

- (BOOL)saveChanges;

@end
