//
//  MainInitialization.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MainInitialization.h"

// 系统库头文件


// 第三方库头文件
@import MTRouter;

// 自定义模块的头文件
#import "HomePageController.h"
#import "SettingController.h"
#import "ThemeController.h"
#import "LanguageController.h"

@implementation MainInitialization
#pragma mark - Lifecycle
+ (void)load {
    [MTRouter.router registerUrl:@"main://homepageCtrl#fdd" controllerCls:HomePageController.class];
    [MTRouter.router registerUrl:@"main://settingCtrl#fdd" controllerCls:SettingController.class];
    [MTRouter.router registerUrl:@"main://themeCtrl#fdd" controllerCls:ThemeController.class];
    [MTRouter.router registerUrl:@"main://languageCtrl#fdd" controllerCls:LanguageController.class];
    
    [MTRouter.router registerUrl:@"main://setUserInfo" handler:^id(NSDictionary *parameters) {
        HomePageController *ctrl = (HomePageController *)parameters[@"pushCtrl"];
        NSString *username = parameters[@"username"];
        NSString *password = parameters[@"password"];
        [ctrl setUsername:username password:password];
        return nil;
    }];
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
