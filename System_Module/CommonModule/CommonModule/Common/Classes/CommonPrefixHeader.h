//
//  CommonPrefixHeader.h
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#ifndef CommonPrefixHeader_h
#define CommonPrefixHeader_h

//document位置
#define DocumentPath(path) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:path]


//字体
#define MTFont(size) [UIFont systemFontOfSize:size]

//去除两边空格
#define MTTrim(string) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

//屏幕

// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

//获取系统版本
#define IOS_SYSTEM_STRING [[UIDevice currentDevice] systemVersion]


/**定义颜色的宏*/
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//版本
#define IOS6_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS9_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )
#define IOS10_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending )

//屏幕宽高，缩放比
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_SCALE [[UIScreen mainScreen] scale]


//应用版本
#define SystemVersion [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]
#define SystemVersionInt [[SystemVersion stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue]

//系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//是否是真机
#define isIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//是否是iphoneX
#define isIPhoneX (SCREEN_WIDTH >= 375.0f && SCREEN_HEIGHT >= 812.0f && isIPhone)
//底部安全高度
#define BOTTOM_SAFE_HEIGHT (isIPhoneX ? 34 : 0)
//系统手势高度
#define SYSTEM_GESTURE_HEIGHT (isIPhoneX ? 13 : 0)
//tabbar高度
#define TABBAR_HEIGHT (49 + BOTTOM_SAFE_HEIGHT)
//状态栏高度
#define STATUS_HEIGHT (isIPhoneX ? 44 : 20)
//导航栏高
#define NAVBAR_HEIGHT 44

//将对象转换成弱引用类型，有block时使用
#define WeakObj(obj) __block __weak typeof(obj) weak_##obj = obj

//debug模式
#ifdef DEBUG
#import "NSDate+MTExtension.h"
#define MTLog(...) printf("\n%s  %s 第%d行 : \n          %s\n",[[NSDate dateToString:[NSDate date] format:@"HH:mm:ss"] UTF8String],__func__,__LINE__,[[NSString stringWithFormat:__VA_ARGS__] UTF8String]);
#else
#define MTLog(...)

#endif

#define CurrentBundle(class) [NSBundle bundleForClass:class]

#import "MTViewController.h"
#import "UIImage+MTExtension.h"
#define CommonModuleUIImageNamed(imageName) [UIImage imageNamed:imageName withBundlePath:CurrentBundle(MTViewController.class).bundlePath]

///当前app语言
#define kCurrentLanguage @"kCurrentLanguage"
///当前app主题
#define kCurrentTheme @"kCurrentTheme"

#endif /* CommonPrefixHeader_h */
