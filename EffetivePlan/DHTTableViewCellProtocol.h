//
//  DHTTableViewCellProtocol.h
//  EffetivePlan
//
//  Created by happyo on 16/7/13.
//  Copyright © 2016年 happyo. All rights reserved.
//

#ifndef DHTTableViewCellProtocol_h
#define DHTTableViewCellProtocol_h

#import "DHTTableViewItem.h"

@protocol DHTTableViewCellDelegate <NSObject>

@required

- (void)cellDidLoad;

+ (CGFloat)heightForCellWithItem:(DHTTableViewItem *)item;

- (void)configCellWithItem:(DHTTableViewItem *)item;

@end


#endif /* DHTTableViewCellProtocol_h */
