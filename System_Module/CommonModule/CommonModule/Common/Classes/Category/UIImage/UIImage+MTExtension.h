//
//  UIImage+MTExtension.h
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIImage拓展
 */
@interface UIImage (MTExtension)

/**
 pod模块加载图片
 
 @param imageNamed 图片名字
 @param bundlePath framework路径
 @return 图片数据
 */
+ (UIImage*)imageNamed:(NSString*)imageNamed withBundlePath:(NSString*)bundlePath;


/**
 改变大小
 
 @param newsize 新的尺寸
 @return 新的图片
 */
- (UIImage*)transformToSize:(CGSize)newsize;


/**
 缩放
 
 @param scale 缩放系数
 @return 返回缩放的图片
 */
- (UIImage *)scale:(CGFloat)scale;
@end
