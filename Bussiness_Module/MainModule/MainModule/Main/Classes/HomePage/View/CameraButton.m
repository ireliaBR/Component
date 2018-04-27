//
//  CameraButton.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "CameraButton.h"

// 系统库头文件


// 第三方库头文件
#import <MTTheme/MTTheme.h>

// 自定义模块的头文件
#import "MainPrefixHeader.h"

@interface CameraButton()

@property (nonatomic, strong) MTImageView *iconImageView;
@property (nonatomic, strong) MTLabel *nameLabel;

@end

@implementation CameraButton
#pragma mark - Lifecycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self theme_setBackgroundColorIdentifier:@"HomepageController.camerBtn.backgroundColor" moduleName:@"main"];
        self.layer.cornerRadius = 115.0/2;
        
        [self setupUI];
    }
    return self;
}

#pragma mark - Custom Accessors
- (MTImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [MTImageView new];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.image = UIImageNamed(icon_hompage_camera_default);
        [_iconImageView theme_setImageIdentifier:@"btn_homepage_camera_normal" moduleName:@"main"];
    }
    return _iconImageView;
}

- (MTLabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [MTLabel new];
        _nameLabel.font = MTFont(15);
        _nameLabel.textColor = UIColorFromRGB(0xffffff);
        [_nameLabel theme_setTextIdentifier:@"HomepageController.cameraBtn.text" moduleName:@"main"];
    }
    return _nameLabel;
}

#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private
- (void)setupUI {
    
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(30);
    }];
    
    
    [self addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(10);
    }];
}

#pragma mark - Protocol conformance


@end
