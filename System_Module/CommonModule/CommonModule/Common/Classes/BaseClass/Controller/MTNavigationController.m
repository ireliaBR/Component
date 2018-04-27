//
//  MTNavigationController.m
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTNavigationController.h"
#import "CommonPrefixHeader.h"

@interface MTNavigationController ()

@end

@implementation MTNavigationController
#pragma mark - Lifecycle
+(void)initialize
{
    [super initialize];
    
    //设置背景色
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barStyle = UIStatusBarStyleDefault;
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //去除navigationBar下面的线
//    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x000000),NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
    
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
