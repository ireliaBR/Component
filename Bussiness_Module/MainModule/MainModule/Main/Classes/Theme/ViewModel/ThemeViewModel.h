//
//  ThemeViewModel.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>
@class ThemeModel;

@interface ThemeViewModel : MTBaseViewModel
- (NSInteger)rowCount;
- (ThemeModel *)modelWithRow:(NSInteger)row;

/**
 改变选中的主题

 @param theme 主题名
 */
- (void)changeSelectedTheme:(NSString *)theme;
@end
