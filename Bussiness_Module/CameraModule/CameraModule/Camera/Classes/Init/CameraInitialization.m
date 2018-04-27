//
//  CameraInitialization.m
//  CameraModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "CameraInitialization.h"

// 系统库头文件


// 第三方库头文件
@import MTRouter;

// 自定义模块的头文件
#import "CameraController.h"

@implementation CameraInitialization
#pragma mark - Lifecycle
+ (void)load {
    [MTRouter.router registerUrl:@"camera://cameraCtrl" controllerCls:CameraController.class];
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
