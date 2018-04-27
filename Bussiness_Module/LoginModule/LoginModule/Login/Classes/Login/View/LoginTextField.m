//
//  LoginTextField.m
//  LoginModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "LoginTextField.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "LoginPrefixHeader.h"

@interface LoginTextField()

/**
 textField描述
 */
@property (nonatomic, strong) MTLabel *memoLabel;
/**
 文本
 */
@property (nonatomic, strong) MTTextField *textField;
/**
 横线
 */
@property (nonatomic, strong) MTView *lineView;

@end

@implementation LoginTextField

#pragma mark - Lifecycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self memoLabel];
        [self textField];
        [self lineView];
    }
    return self;
}

#pragma mark - Custom Accessors
- (MTLabel *)memoLabel
{
    if (!_memoLabel) {
        _memoLabel = [MTLabel new];
        _memoLabel.font = MTFont(18);
        _memoLabel.textColor = UIColorFromRGB(0x4a4a4a);
        [self addSubview:_memoLabel];
        [_memoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
        }];
    }
    return _memoLabel;
}

- (MTTextField *)textField {
    if (!_textField) {
        _textField = [MTTextField new];
        _textField.font = MTFont(18);
        _textField.textColor = UIColorFromRGB(0x4a4a4a);
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(75);
            make.right.equalTo(self);
            make.centerY.equalTo(self.memoLabel);
        }];
    }
    return _textField;
}

- (MTView *)lineView {
    if (!_lineView) {
        _lineView = [MTView new];
        _lineView.backgroundColor = UIColorFromRGB(0x969696);
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.right.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _lineView;
}


#pragma mark - IBActions


#pragma mark - Public

- (void)setSecureTextEntry:(BOOL)secureTextEntry {
    _secureTextEntry = secureTextEntry;
    self.textField.secureTextEntry = secureTextEntry;
}

- (NSString *)text {
    return self.textField.text;
}

#pragma mark - Private


#pragma mark - Protocol conformance


@end
