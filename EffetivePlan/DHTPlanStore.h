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

/**
 *  获取所有的plan
 *
 *  @return 得到的plan
 */
- (NSArray *)allPlans;

/**
 *  获取指定位置的plan
 *
 *  @param index 位置
 *
 *  @return 得到的plan
 */
- (DHTPlan *)planAtIndex:(NSInteger) index;

/**
 *  得到新建的plan
 *
 *  @return 得到的plan
 */
- (DHTPlan *)getNewPlan;

/**
 *  插入plan
 *
 *  @param plan 待插入的plan
 */
- (void)insertPlan:(DHTPlan *)plan;

/**
 *  修改plan
 *
 *  @param plan 需要修改的plan
 */
- (void)modifyPlan:(DHTPlan *)plan;


/**
 *  保存变化
 *
 *  @return 是否保存成功
 */
- (BOOL)saveChanges;

/**
 *  获得新建的do
 */
- (DHTDo *)getNewDo;

@end
