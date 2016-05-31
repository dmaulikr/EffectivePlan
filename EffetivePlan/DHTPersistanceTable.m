//
//  DHTPersistanceTable.m
//  EffetivePlan
//
//  Created by happyo on 16/5/30.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceTable.h"
#import "DHTPersistanceDataBase.h"

@interface DHTPersistanceTable ()

@property (nonatomic, weak) id<DHTPersistanceTableProtocol> child;


@end
@implementation DHTPersistanceTable

- (instancetype)init
{
    self = [super init];
    
    if (self && [self conformsToProtocol:@protocol(DHTPersistanceTableProtocol)]) {
        //
        self.child = (DHTPersistanceTable<DHTPersistanceTableProtocol> *)self;
        
        
    }
    
    return self;
}



@end
