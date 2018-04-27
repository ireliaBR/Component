//
//  SettingModel.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>

/**
 设置的model
 */
@interface SettingModel : MTBaseModel


/**
 标题
 */
@property (nonatomic, copy) NSString *nameIdentifier;

/**
 描述
 */
@property (nonatomic, copy) NSString *memo;

/**
 路由地址
 */
@property (nonatomic, copy) NSString *routerAddress;

- (instancetype)initWithNameIdentifier:(NSString *)nameIdentifier
                                  memo:(NSString *)memo
                         routerAddress:(NSString *)routerAddress;
@end
