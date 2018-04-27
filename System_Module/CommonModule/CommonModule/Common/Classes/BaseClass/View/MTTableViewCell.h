//
//  MTTableViewCell.h
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTBaseModel;
/**
 TableViewCell基类
 */
@interface MTTableViewCell : UITableViewCell
@property (nonatomic, weak) MTBaseModel *model;

/**
 通过model获取cell缓存高度

 @param model model
 */
+ (CGFloat)getCellHeightWithModel:(MTBaseModel *)model;
@end
