//
//  AppDelegate.m
//  LoginModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "AppDelegate.h"
#import <CommonModule/CommonModule.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ThemeLanguageManager.manager initializeManager];
    return YES;
}


@end
