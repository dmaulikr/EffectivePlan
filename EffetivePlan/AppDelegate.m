//
//  AppDelegate.m
//  EffetivePlan
//
//  Created by happyo on 15/5/9.
//  Copyright (c) 2015年 happyo. All rights reserved.
//

#import "AppDelegate.h"
#import "DHTPlanViewController.h"
#import "DHTDoViewController.h"
#import "DHTCheckViewController.h"
#import "DHTActionViewController.h"
#import "DHTPlanStore.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // plan
    DHTPlanViewController *planVC = [[DHTPlanViewController alloc] init];
    UINavigationController *navPlanController = [[UINavigationController alloc] initWithRootViewController:planVC];
    
    // do
    DHTDoViewController *doVC = [[DHTDoViewController alloc] init];
    UINavigationController *navDoController = [[UINavigationController alloc] initWithRootViewController:doVC];
    
    // check
    DHTCheckViewController *checkVC = [[DHTCheckViewController alloc] init];
    UINavigationController *navCheckController = [[UINavigationController alloc] initWithRootViewController:checkVC];
    
    // action
    DHTActionViewController *actionVC = [[DHTActionViewController alloc] init];
    UINavigationController *navActionController = [[UINavigationController alloc] initWithRootViewController:actionVC];
    
    // 将上面的navigationController整合进UITabBarController里面
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    tabBarController.viewControllers = @[navPlanController, navDoController, navCheckController, navActionController];
    
//    UIImage *finishedImage = [UIImage imageNamed:@"Time1"];
//    UIImage *unfinishedImage = [UIImage imageNamed:@"Time1"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third", @"four"];
    
    RDVTabBar *tabBar = [tabBarController tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 63)];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
//        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"tb_%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"tb_%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
    
    // 将tabBarController设为rootViewController
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    BOOL successful = [[DHTPlanStore sharedStore] saveChanges];
    if (successful) {
        NSLog(@"save all changes");
    } else {
        NSLog(@"failed to save changes");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
