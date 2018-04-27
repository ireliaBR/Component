//
//  SettingViewModel.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "SettingViewModel.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "SettingModel.h"
#import "ThemeLanguageManager.h"

@interface SettingViewModel()

@property (nonatomic, strong) NSArray<SettingModel *> *models;

@end

@implementation SettingViewModel
#pragma mark - Lifecycle


#pragma mark - Custom Accessors
- (NSArray<SettingModel *> *)models {
    if (!_models) {
        NSString *currentTheme = [ThemeLanguageManager.manager currentTheme];
        NSString *currentLanguage = [ThemeLanguageManager.manager currentLanguage];
        
        SettingModel *model1 = [[SettingModel alloc] initWithNameIdentifier:@"SettingController.cell.nameLabel.theme.text"
                                                                       memo:currentTheme
                                                              routerAddress:@"main://themeCtrl"];
        SettingModel *model2 = [[SettingModel alloc] initWithNameIdentifier:@"SettingController.cell.nameLabel.language.text"
                                                                       memo:currentLanguage
                                                              routerAddress:@"main://languageCtrl"];
        
        _models = @[model1, model2];
    }
    return _models;
}

#pragma mark - IBActions


#pragma mark - Public
- (NSInteger)rowCount {
    return self.models.count;
}

- (SettingModel *)modelWithRow:(NSInteger)row {
    return self.models[row];
}

- (void)reloadData {
    self.models = nil;
    [self models];
}

#pragma mark - Private


#pragma mark - Protocol conformance

@end
