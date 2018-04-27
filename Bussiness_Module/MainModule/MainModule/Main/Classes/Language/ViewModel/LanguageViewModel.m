//
//  LanguageViewModel.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "LanguageViewModel.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "ThemeModel.h"
#import "ThemeLanguageManager.h"

@interface LanguageViewModel()
@property (nonatomic, strong) NSArray<ThemeModel *> *models;
@end

@implementation LanguageViewModel
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSArray<ThemeModel *> *)models {
    if (!_models) {
        NSArray<NSString *> *languages = [ThemeLanguageManager.manager languages];
        NSString *currentLanguage = [ThemeLanguageManager.manager currentLanguage];
        
        NSMutableArray<ThemeModel *> *models = [[NSMutableArray alloc] initWithCapacity:languages.count];
        for (NSString *language in languages) {
            BOOL isSelected = NO;
            if ([language isEqualToString:currentLanguage]) {
                isSelected = YES;
            }
            ThemeModel *model = [[ThemeModel alloc] initWithName:language isSelected:isSelected];
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

- (void)changeSelectedLanguage:(NSString *)language {
    for (ThemeModel *model in self.models) {
        if ([model.name isEqualToString:language]) {
            model.isSelected = YES;
            continue;
        }
        model.isSelected = NO;
    }
}
#pragma mark - Private


#pragma mark - Protocol conformance

@end
