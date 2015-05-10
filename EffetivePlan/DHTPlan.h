//
//  DHTPlan.h
//  EffetivePlan
//
//  Created by happyo on 15/5/10.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DHTPlan : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * instruction;
@property (nonatomic, retain) NSDate * dateCreated;

@end
