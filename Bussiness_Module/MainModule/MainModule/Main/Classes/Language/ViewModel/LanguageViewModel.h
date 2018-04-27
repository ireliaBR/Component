//
//  LanguageViewModel.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>
@class ThemeModel;

@interface LanguageViewModel : MTBaseViewModel
- (NSInteger)rowCount;
- (ThemeModel *)modelWithRow:(NSInteger)row;

/**
 改变选中的语言
 
 @param language 主题名
 */
- (void)changeSelectedLanguage:(NSString *)language;
@end
