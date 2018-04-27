//
//  ThemeLanguageManager.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 主题和语言的管理类
 */
@interface ThemeLanguageManager : NSObject
@property (nonatomic, strong, readonly, class) ThemeLanguageManager *manager;
/**
 初始化
 */
- (void)initializeManager;

/**
 设置主题

 @param theme 主题名
 */
- (void)setTheme:(NSString *)theme;

/**
 设置语言

 @param language 语言
 */
- (void)setLanguage:(NSString *)language;

/**
 返回主题列表

 @return 主题列表
 */
- (NSArray<NSString *> *)themes;

/**
 返回语言列表

 @return 语言列表
 */
- (NSArray<NSString *> *)languages;

/**
 返回当前主题

 @return 当前主题
 */
- (NSString *)currentTheme;

/**
 返回当前语言

 @return 当前语言
 */
- (NSString *)currentLanguage;
@end
