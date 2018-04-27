//
//  LoginInitialization.m
//  LoginModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "LoginInitialization.h"

// 系统库头文件


// 第三方库头文件
@import MTRouter;

// 自定义模块的头文件
#import "LoginController.h"

@implementation LoginInitialization
#pragma mark - Lifecycle
+ (void)load {
    [MTRouter.router registerUrl:@"login://loginCtrl" controllerCls:LoginController.class];
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
