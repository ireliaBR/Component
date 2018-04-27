//
//  ThemeLanguageManager.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ThemeLanguageManager.h"

// 系统库头文件


// 第三方库头文件
#import <MTTheme/MTTheme.h>

// 自定义模块的头文件
#import "CommonPrefixHeader.h"

@interface ThemeLanguageManager()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation ThemeLanguageManager
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSUserDefaults *)userDefaults {
    if (!_userDefaults) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}

#pragma mark - IBActions


#pragma mark - Public
+ (ThemeLanguageManager *)manager {
    static ThemeLanguageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [ThemeLanguageManager new];
    });
    return manager;
}

/**
 初始化
 */
- (void)initializeManager {
    NSString *currentTheme = [self.userDefaults valueForKey:kCurrentTheme];
    NSString *currentLanguage = [self.userDefaults valueForKey:kCurrentLanguage];
    
    if (currentTheme == nil) {
        currentTheme = @"默认";
    }
    
    if (currentLanguage == nil) {
        currentLanguage = @"简体中文";
    }
    
    //主题模块初始化
    NSString *path = [NSBundle mainBundle].bundlePath;
    NSString *themePath = [path stringByAppendingPathComponent:@"Theme"];
    themePath = [themePath stringByAppendingPathComponent:currentTheme];
    [MTThemeManager initializeWithDefaultThemePath:themePath];
    
    //字体模块初始化
    NSString *fontPath = [path stringByAppendingPathComponent:@"Font"];
    fontPath = [fontPath stringByAppendingPathComponent:currentLanguage];
    [MTFontManager initializeWithDefaultFontPath:fontPath];
    
    [self.userDefaults setValue:currentTheme forKey:kCurrentTheme];
    [self.userDefaults setValue:currentLanguage forKey:kCurrentLanguage];
    [self.userDefaults synchronize];
}

/**
 设置主题
 
 @param theme 主题名
 */
- (void)setTheme:(NSString *)theme {
    NSString *path = [NSBundle mainBundle].bundlePath;
    NSString *themePath = [path stringByAppendingPathComponent:@"Theme"];
    themePath = [themePath stringByAppendingPathComponent:theme];
    [MTThemeManager.manager setThemePath:themePath];
    
    [self.userDefaults setValue:theme forKey:kCurrentTheme];
    [self.userDefaults synchronize];
}

/**
 设置语言
 
 @param language 语言
 */
- (void)setLanguage:(NSString *)language {
    NSString *path = [NSBundle mainBundle].bundlePath;
    NSString *fontPath = [path stringByAppendingPathComponent:@"Font"];
    fontPath = [fontPath stringByAppendingPathComponent:language];
    [MTFontManager.manager setFontPath:fontPath];
    
    [self.userDefaults setValue:language forKey:kCurrentLanguage];
    [self.userDefaults synchronize];
}

/**
 返回主题列表
 
 @return 主题列表
 */
- (NSArray<NSString *> *)themes {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [NSBundle mainBundle].bundlePath;
    NSString *themePath = [path stringByAppendingPathComponent:@"Theme"];
    NSArray<NSString *> *themes = [fileManager contentsOfDirectoryAtPath:themePath error:nil];
    return themes;
}

/**
 返回语言列表
 
 @return 语言列表
 */
- (NSArray<NSString *> *)languages {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [NSBundle mainBundle].bundlePath;
    NSString *languagePath = [path stringByAppendingPathComponent:@"Font"];
    NSArray<NSString *> *languages = [fileManager contentsOfDirectoryAtPath:languagePath error:nil];
    return languages;
}

/**
 返回当前主题
 
 @return 当前主题
 */
- (NSString *)currentTheme {
    NSString *currentTheme = [self.userDefaults valueForKey:kCurrentTheme];
    return currentTheme;
}

/**
 返回当前语言
 
 @return 当前语言
 */
- (NSString *)currentLanguage {
    NSString *currentLanguage = [self.userDefaults valueForKey:kCurrentLanguage];
    return currentLanguage;
}

#pragma mark - Private


#pragma mark - Protocol conformance

@end
