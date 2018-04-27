//
//  ThemeViewModel.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ThemeViewModel.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "ThemeModel.h"
#import "ThemeLanguageManager.h"

@interface ThemeViewModel()
@property (nonatomic, strong) NSArray<ThemeModel *> *models;
@end

@implementation ThemeViewModel
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSArray<ThemeModel *> *)models {
    if (!_models) {
        NSArray<NSString *> *themes = [ThemeLanguageManager.manager themes];
        NSString *currentTheme = [ThemeLanguageManager.manager currentTheme];
        
        NSMutableArray<ThemeModel *> *models = [[NSMutableArray alloc] initWithCapacity:themes.count];
        for (NSString *theme in themes) {
            BOOL isSelected = NO;
            if ([theme isEqualToString:currentTheme]) {
                isSelected = YES;
            }
            ThemeModel *model = [[ThemeModel alloc] initWithName:theme isSelected:isSelected];
            [models addObject:model];
        }
        _models = [models copy];
    }
    return _models;
}

#pragma mark - IBActions


#pragma mark - Public
- (NSInteger)rowCount {
    return self.models.count;
}

- (ThemeModel *)modelWithRow:(NSInteger)row {
    return self.models[row];
}

- (void)changeSelectedTheme:(NSString *)theme {
    for (ThemeModel *model in self.models) {
        if ([model.name isEqualToString:theme]) {
            model.isSelected = YES;
            continue;
        }
        model.isSelected = NO;
    }
}
#pragma mark - Private


#pragma mark - Protocol conformance

@end
