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

#define ROOT_TABBAR_CONTROLLER (RDVTabBarController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController]

#define CURRENT_NAVIGATION_CONTROLLER (UINavigationController *)[ROOT_TABBAR_CONTROLLER selectedViewController]

#endif /* APPMacro_h */
