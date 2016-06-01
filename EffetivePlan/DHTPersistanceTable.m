//
//  DHTPersistanceTable.m
//  EffetivePlan
//
//  Created by happyo on 16/5/30.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import "DHTPersistanceTable.h"
#import "DHTPersistanceDataBase.h"
#import "DHTPersistanceQueryCommand+SchemaManipulate.h"


@interface DHTPersistanceTable ()

@property (nonatomic, weak) id<DHTPersistanceTableProtocol> child;


@end
@implementation DHTPersistanceTable

- (instancetype)init
{
    self = [super init];
    
    if (self && [self conformsToProtocol:@protocol(DHTPersistanceTableProtocol)]) {
        //
        self.child = (DHTPersistanceTable <DHTPersistanceTableProtocol> *)self;
        
        DHTPersistanceQueryCommand *queryCommand = [[DHTPersistanceQueryCommand alloc] initWithDatabaseName:self.child.databaseName];
        
        [queryCommand createTableWithName:self.child.tableName columns:self.child.columnInfo];
        
        NSError *error = nil;
        [queryCommand excuteWithError:&error];
        
        if (error) {
            NSLog(@"Error at [%s]:[%d]:%@", __FILE__, __LINE__, error);
        }
    } else {
        NSException *exception = [NSException exceptionWithName:@"DHTPersistanceTable init error" reason:@"the child class must conforms to protocol: <DHTPersistanceTableProtocol>" userInfo:nil];
        @throw exception;
    }
    
    return self;
}



@end
