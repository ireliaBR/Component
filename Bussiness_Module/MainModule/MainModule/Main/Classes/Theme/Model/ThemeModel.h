//
//  ThemeModel.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>

@interface ThemeModel : MTBaseModel

/**
 名字
 */
@property (nonatomic, copy) NSString *name;

/**
 是否选中
 */
@property (nonatomic, assign) BOOL isSelected;

- (instancetype)initWithName:(NSString *)name isSelected:(BOOL)isSelected;
@end
