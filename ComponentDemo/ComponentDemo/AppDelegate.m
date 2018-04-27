//
//  AppDelegate.m
//  ComponentDemo
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "AppDelegate.h"

// 系统库头文件


// 第三方库头文件
@import MTRouter;
#import <CommonModule/CommonModule.h>

// 自定义模块的头文件

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [ThemeLanguageManager.manager initializeManager];
    
    UIViewController *ctrl = [MTRouter.router executeUrl:@"main://homepageCtrl"];
    MTNavigationController *navCtrl = [[MTNavigationController alloc] initWithRootViewController:ctrl];
    self.window.rootViewController = navCtrl;
    return YES;
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance




@end
