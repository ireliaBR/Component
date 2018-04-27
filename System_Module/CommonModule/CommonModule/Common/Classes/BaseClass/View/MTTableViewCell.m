//
//  MTTableViewCell.m
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTTableViewCell.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MTBaseModel.h"

@implementation MTTableViewCell
#pragma mark - Lifecycle


#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public
+ (CGFloat)getCellHeightWithModel:(MTBaseModel *)model {
    NSAssert(NO, @"子类必须重写 %s", __func__);
    return 0;
}

#pragma mark - Private


#pragma mark - Protocol conformance


@end
