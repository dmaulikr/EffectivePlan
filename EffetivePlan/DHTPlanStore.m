//
//  DHTPlanStore.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "DHTPlanStore.h"
#import "DHTDo.h"
@import CoreData;

@interface DHTPlanStore ()

@property (nonatomic, strong) NSManagedObjectModel *model;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
@implementation DHTPlanStore

+ (instancetype)sharedStore
{
    static DHTPlanStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[DHTPlanStore alloc] initPrivate];
    }
    
    return sharedStore;
}

#pragma mark - init method -
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Please use [DHTPlanStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        
        // 设置sqlite文件路径
        NSString *path = [self planArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        NSError *error = nil;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            @throw [NSException exceptionWithName:@"OpenFailure" reason:[error localizedDescription] userInfo:nil];
        }
        
        // 创建NSManagedObjectContext对象
        _context = [[NSManagedObjectContext alloc] init];
        [_context setPersistentStoreCoordinator:psc];
        
        [self loadAllPlans];
    }
    return self;
}

#pragma mark - public method -
- (NSArray *)allPlans
{
    return self.planList;
}

- (DHTPlan *)planAtIndex:(NSInteger)index
{
    return [self.planList objectAtIndex:index];
}

- (DHTPlan *)getNewPlan
{
    NSEntityDescription *d = [NSEntityDescription entityForName:@"DHTPlan" inManagedObjectContext:self.context];
    return [[DHTPlan alloc] initWithEntity:d insertIntoManagedObjectContext:self.context];
}

- (void)insertPlan:(DHTPlan *)plan
{
    double planId;
    if ([self.planList count] == 0) {
        planId = 1.0;
    } else {
        planId = [[[self.planList lastObject] planId] floatValue] + 1.0;
    }
//    DHTPlan *storedPlan = [NSEntityDescription insertNewObjectForEntityForName:@"DHTPlan" inManagedObjectContext:self.context];
//    storedPlan.title = plan.title;
//    storedPlan.instruction = plan.instruction;
    plan.planId = [NSNumber numberWithDouble:planId];
    plan.dateCreated = [[NSDate alloc] init];
    
    [self.planList addObject:plan];
}

- (void)modifyPlan:(DHTPlan *)plan
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *e = [NSEntityDescription entityForName:@"DHTPlan" inManagedObjectContext:self.context];

    request.entity = e;
    NSPredicate *p = [NSPredicate predicateWithFormat:@"planId == %f", [plan.planId doubleValue]];
    [request setPredicate:p];
    
    NSError *requestError = nil;
    NSArray *plans = [self.context executeFetchRequest:request error:&requestError];
    if ([plans count] > 0) {
        DHTPlan *modifyPlan = [plans firstObject];
        modifyPlan.title = plan.title;
        modifyPlan.instruction = plan.instruction;
    } else {
        NSLog(@"couldn't find the plan ");
    }
}


/**
 *  保存数据到core data
 *
 *  @return 是否成功
 */
- (BOOL)saveChanges
{
    NSError *error;
    BOOL successful = [self.context save:&error];
    if (!successful) {
        NSLog(@"Error saving : %@", [error localizedDescription]);
    }
    return successful;
}

#pragma mark - private method - 
/**
 *  获取存放数据的路径
 *
 *  @return 数据路径
 */
- (NSString *)planArchivePath
{
    NSArray *documentDictionaries = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDictionary = [documentDictionaries firstObject];
    
    return [documentDictionary stringByAppendingString:@"store.data"];
}

/**
 *  获取所有的plan
 */
- (void)loadAllPlans
{
    if (!self.planList) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *e = [NSEntityDescription entityForName:@"DHTPlan" inManagedObjectContext:self.context];
        
        request.entity = e;
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"dateCreated" ascending:YES];
        request.sortDescriptors = @[sd];
        
        NSError *error;
        NSArray *result = [self.context executeFetchRequest:request error:&error];
        
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason : %@", [error localizedDescription]];
        }
        self.planList = [[NSMutableArray alloc] initWithArray:result];
    }
}

- (DHTDo *)getNewDo
{
    NSEntityDescription *e = [NSEntityDescription entityForName:@"DHTDo" inManagedObjectContext:self.context];
    return [[DHTDo alloc] initWithEntity:e insertIntoManagedObjectContext:self.context];
}


@end
