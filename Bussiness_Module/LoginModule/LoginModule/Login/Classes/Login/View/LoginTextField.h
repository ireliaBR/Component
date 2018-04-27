//
//  LoginTextField.h
//  LoginModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>

/**
 登陆的输入框
 */
@interface LoginTextField : MTView

/**
 textField描述
 */
@property (nonatomic, strong, readonly) MTLabel *memoLabel;
/**
 文本
 */
@property (nonatomic, strong, readonly) MTTextField *textField;
/**
 文本内容
 */
@property (nonatomic, copy, readonly) NSString *text;

/**
 是否加密
 */
@property (nonatomic, assign) BOOL secureTextEntry;
@end
