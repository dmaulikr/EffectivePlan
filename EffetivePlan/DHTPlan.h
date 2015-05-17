//
//  DHTPlan.h
//  EffetivePlan
//
//  Created by happyo on 15/5/16.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DHTAction, DHTCheck, DHTDo;

@interface DHTPlan : NSManagedObject

@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSString * instruction;
@property (nonatomic, retain) NSNumber * planId;
@property (nonatomic, retain) NSString * title;

/**
 *   计划状态，1. in plan 2. in do 3.in check 4.in action 5.archive
 */
@property (nonatomic, retain) NSNumber * status;

@property (nonatomic, retain) DHTAction *planToAction;
@property (nonatomic, retain) DHTCheck *planToCheck;
@property (nonatomic, retain) NSSet *planToDo;
@end

@interface DHTPlan (CoreDataGeneratedAccessors)

- (void)addPlanToDoObject:(DHTDo *)value;
- (void)removePlanToDoObject:(DHTDo *)value;
- (void)addPlanToDo:(NSSet *)values;
- (void)removePlanToDo:(NSSet *)values;

@end
