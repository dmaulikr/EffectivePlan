//
//  APPMacro.h
//  EffetivePlan
//
//  Created by happyo on 16/4/16.
//  Copyright © 2016年 happyo. All rights reserved.
//

#ifndef APPMacro_h
#define APPMacro_h


#define CREAT_XIB(__xibname__)  {[[[NSBundle mainBundle] loadNibNamed:__xibname__ owner:nil options:nil] objectAtIndex:0]}

//#define CURRENT_NAVIGATION_CONTROLLER (UINavigationController *)[[(UITabBarController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController] selectedViewController] navigationController]

//#define CURRENT_VIEW_CONTROLLER  \
//- (UIViewController *)currentViewController                                                             \
//{                                                                                                       \
//    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;              \
//    if ([vc isKindOfClass:[UITabBarController class]]) {                                                \
//        UITabBarController *tab = (UITabBarController *)vc;                                             \
//        if ([tab.selectedViewController isKindOfClass:[UINavigationController class]]) {                \
//            UINavigationController *nav = (UINavigationController *)tab.selectedViewController;         \
//            return [nav.viewControllers lastObject];                                                    \
//        } else {                                                                                        \
//            return tab.selectedViewController;                                                          \
//        }                                                                                               \
//    } else if ([vc isKindOfClass:[UINavigationController class]]) {                                     \
//        UINavigationController *nav = (UINavigationController *)vc;                                     \
//        return [nav.viewControllers lastObject];                                                        \
//    } else {                                                                                            \
//        return vc;                                                                                      \
//    }                                                                                                   \
//                                                                                                        \
//    return nil;                                                                                         \
//}                                                                                                       \

//#define CURRENT_VIEW_CONTROLLER [[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UITabBarController class]] ? ([[UIApplication sharedApplication].keyWindow.rootViewController.selectedViewController isKindOfClass:[UINavigationController class]] ? ([(UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController.selectedViewController.viewControllers lastObject]): ((UITabBarController *)([UIApplication sharedApplication].keyWindow.rootViewController).selectedViewController)) : ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UINavigationController class]] ? ([(UINavigationController*)([UIApplication sharedApplication].keyWindow.rootViewController).viewControllers lastObject]) : ( [UIApplication sharedApplication].keyWindow.rootViewController))

#endif /* APPMacro_h */
