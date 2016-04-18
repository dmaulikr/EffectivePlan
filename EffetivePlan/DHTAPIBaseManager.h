//
//  DHTAPIBaseManager.h
//  EffetivePlan
//
//  Created by happyo on 16/4/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHTNetworkingConfiguration.h"
@class DHTAPIBaseManager;



/*************************************************************************************************/
/*                               DHTAPIManagerApiCallBackManager                                 */
/*************************************************************************************************/

//api回调
@protocol DHTAPIManagerApiCallBackDelegate <NSObject>

@required
- (void)managerCallAPIDidSuccess:(DHTAPIBaseManager *)manager;
- (void)managerCallAPIDidFailed:(DHTAPIBaseManager *)manager;

@end






/*************************************************************************************************/
/*                               DHTAPIManagerParamsSourceDelegate                               */
/*************************************************************************************************/
@protocol DHTAPIManagerParamsSourceDelegate <NSObject>

@required
- (NSDictionary *)paramsForApi:(DHTAPIBaseManager *)manager;

@end






/*************************************************************************************************/
/*                               DHTAPIManager                                                   */
/*************************************************************************************************/
@protocol DHTAPIManager <NSObject>

@required
- (NSString *)methodName;

- (NSString *)serviceType; // serviceIdentifier

- (DHTRequestType)requestType;

@optional
- (void)cleanData;

- (NSDictionary *)reformParams:(NSDictionary *)params;

@end






/*************************************************************************************************/
/*                               DHTAPIManagerInterceptor                                        */
/*************************************************************************************************/
@protocol DHTAPIManagerInterceptor <NSObject>

@optional
//- (void)manage:(DHTAPIBaseManager *)manager beforePerformSuccessWithResponse:(DHTURLResponse *)response

@end



/*************************************************************************************************/
/*                               DHTAPIManagerCallbackDataReformer                                           */
/*************************************************************************************************/
@protocol DHTAPIManagerCallbackDataReformer <NSObject>
@required
/*
 比如同样的一个获取电话号码的逻辑，二手房，新房，租房调用的API不同，所以它们的manager和data都会不同。
 即便如此，同一类业务逻辑（都是获取电话号码）还是应该写到一个reformer里面去的。这样后人定位业务逻辑相关代码的时候就非常方便了。
 
 代码样例：
 - (id)manager:(RTAPIBaseManager *)manager reformData:(NSDictionary *)data
 {
 if ([manager isKindOfClass:[xinfangManager class]]) {
 return [self xinfangPhoneNumberWithData:data];      //这是调用了派生后reformer子类自己实现的函数，别忘了reformer自己也是一个对象呀。
 //reformer也可以有自己的属性，当进行业务逻辑需要一些外部的辅助数据的时候，
 //外部使用者可以在使用reformer之前给reformer设置好属性，使得进行业务逻辑时，
 //reformer能够用得上必需的辅助数据。
 }
 
 if ([manager isKindOfClass:[zufangManager class]]) {
 return [self zufangPhoneNumberWithData:data];
 }
 
 if ([manager isKindOfClass:[ershoufangManager class]]) {
 return [self ershoufangPhoneNumberWithData:data];
 }
 }
 */
- (id)manager:(DHTAPIBaseManager *)manager reformData:(NSDictionary *)data;
@end




/*************************************************************************************************/
/*                               DHTAPIBaseManager                                               */
/*************************************************************************************************/
@interface DHTAPIBaseManager : NSObject

@property (nonatomic, weak) id<DHTAPIManagerApiCallBackDelegate> delegate;

@property (nonatomic, weak) id<DHTAPIManagerParamsSourceDelegate> paramsSource;

//@property (nonatomic, weak) id<> interceptor;

@property (nonatomic, weak) NSObject<DHTAPIManager> *child; // 因为类里面用到了NSObject的方法，所以id改为NSObject


@property (nonatomic, assign, readonly) BOOL isLoading;


- (id)fetchDataWithReformer:(id<DHTAPIManagerCallbackDataReformer>)reformer;

- (NSInteger)loadData;

@end


