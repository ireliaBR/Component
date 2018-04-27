//
//  AppDelegate.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "AppDelegate.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "ThemeLanguageManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark - Lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ThemeLanguageManager.manager initializeManager];
    return YES;
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private

#pragma mark - Protocol conformance




@end
