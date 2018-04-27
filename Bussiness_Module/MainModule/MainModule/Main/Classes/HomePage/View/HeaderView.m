//
//  HeaderView.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "HeaderView.h"

// 系统库头文件


// 第三方库头文件
#import <MTTheme/MTTheme.h>

// 自定义模块的头文件
#import "MainPrefixHeader.h"

@interface HeaderView()

/**
 maskLayer
 */
@property (nonatomic, strong) CAShapeLayer *maskShapeLayer;
/**
 背景图
 */
@property (nonatomic, strong) MTImageView *bgImageView;
/**
 毛玻璃
 */
@property (nonatomic, strong) UIVisualEffectView *effectView;
/**
 头像外围圈
 */
@property (nonatomic, strong) MTView *headFrameView;
/**
 头像按钮
 */
@property (nonatomic, strong) MTButton *headBtn;
/**
 描述
 */
@property (nonatomic, strong) MTLabel *nameLabel;
@end

@implementation HeaderView
#pragma mark - Lifecycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xfd72a7);
        [self maskShapeLayer];
        [self bgImageView];
        [self effectView];
        [self headFrameView];
        [self headBtn];
        [self nameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //shapeLayer
    self.maskShapeLayer.frame = self.bounds;
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    
    //弧度的高度
    CGFloat angleHeight = 40;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(0, height - angleHeight)];
    [path addQuadCurveToPoint:CGPointMake(width, height - angleHeight) controlPoint:CGPointMake(width/2, height)];
    [path addLineToPoint:CGPointMake(width, 0)];
    [path closePath];
    self.maskShapeLayer.path = path.CGPath;
}

#pragma mark - Custom Accessors
- (CAShapeLayer *)maskShapeLayer {
    if (!_maskShapeLayer) {
        _maskShapeLayer = [CAShapeLayer layer];
        self.layer.mask = _maskShapeLayer;
    }
    return _maskShapeLayer;
}

- (MTImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [MTImageView new];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFit;
        _bgImageView.image = UIImageNamed(btn_homepage_login_default);
        [_bgImageView theme_setImageIdentifier:@"btn_homepage_login_normal" moduleName:@"main"];
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(-100);
            make.bottom.right.equalTo(self).offset(100);
        }];
    }
    return _bgImageView;
}


- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        [self addSubview:_effectView];
        [_effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _effectView;
}

- (MTView *)headFrameView {
    if (!_headFrameView) {
        _headFrameView = [MTView new];
        _headFrameView.backgroundColor = UIColorFromRGB(0xf8a2ab);
        _headFrameView.layer.cornerRadius = 55;
        [self addSubview:_headFrameView];
        [_headFrameView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.height.mas_equalTo(110);
        }];
    }
    return _headFrameView;
}

- (MTButton *)headBtn {
    if (!_headBtn) {
        _headBtn = [MTButton new];
        [_headBtn setBackgroundImage:UIImageNamed(btn_homepage_login_default) forState:UIControlStateNormal];
        [_headBtn theme_setBackgroundImageIdentifier:@"btn_homepage_login_normal" forState:UIControlStateNormal moduleName:@"main"];
        _headBtn.layer.cornerRadius = 50;
        _headBtn.layer.borderColor = UIColorFromRGB(0xf88e99).CGColor;
        _headBtn.layer.borderWidth = 5;
        [self.headFrameView addSubview:_headBtn];
        [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.headFrameView).offset(5);
            make.bottom.right.equalTo(self.headFrameView).offset(-5);
        }];
        
        [_headBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headBtn;
}

- (MTLabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [MTLabel new];
        _nameLabel.font = MTFont(17);
        _nameLabel.textColor = UIColorFromRGB(0xffffff);
        [_nameLabel theme_setTextIdentifier:@"HomepageController.nameLabel.text" moduleName:@"main"];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.headFrameView.mas_bottom).offset(8);
        }];
    }
    return _nameLabel;
}

#pragma mark - IBActions
- (void)headBtnClick:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(headerViewHeadBtnDidClick:)]) {
        [self.delegate headerViewHeadBtnDidClick:self];
    }
}

#pragma mark - Public
- (void)setName:(NSString *)name {
    _name = name;
    self.nameLabel.text = name;
}

#pragma mark - Private
- (void)setupUI {
    
}

#pragma mark - Protocol conformance


@end
