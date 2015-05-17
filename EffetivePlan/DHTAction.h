//
//  DHTAction.h
//  EffetivePlan
//
//  Created by happyo on 15/5/16.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DHTPlan;

@interface DHTAction : NSManagedObject

@property (nonatomic, retain) NSNumber * actionId;
@property (nonatomic, retain) NSString * aContent;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) DHTPlan *actionToPlan;

@end
