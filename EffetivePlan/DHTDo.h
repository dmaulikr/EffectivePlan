//
//  DHTDo.h
//  EffetivePlan
//
//  Created by happyo on 15/5/16.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DHTPlan;

@interface DHTDo : NSManagedObject

@property (nonatomic, retain) NSNumber * doId;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) DHTPlan *doToPlan;

@end
