//
//  SettingTableViewCell.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "SettingTableViewCell.h"

// 系统库头文件


// 第三方库头文件
#import <MTTheme/MTTheme.h>

// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "SettingModel.h"

@interface SettingTableViewCell()

///标题
@property (nonatomic, strong) MTLabel *nameLabel;
///描述
@property (nonatomic, strong) MTLabel *memoLabel;
///箭头
@property (nonatomic, strong) MTImageView *arrowImageView;
///下划线
@property (nonatomic, strong) MTView *lineView;
@end

@implementation SettingTableViewCell
#pragma mark - Lifecycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView theme_setBackgroundColorIdentifier:@"SettingController.cell.backgroundColor" moduleName:@"main"];
        [self setupUI];
    }
    return self;
}

#pragma mark - Custom Accessors
- (MTLabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [MTLabel new];
        _nameLabel.font = MTFont(16);
        [_nameLabel theme_setTextColorIdentifier:@"SettingController.cell.nameLabel.textColor"
                                      moduleName:@"main"];
    }
    return _nameLabel;
}

- (MTLabel *)memoLabel {
    if (!_memoLabel) {
        _memoLabel = [MTLabel new];
        _memoLabel.font = MTFont(16);
        [_memoLabel theme_setTextColorIdentifier:@"SettingController.cell.memoLabel.textColor"
                                      moduleName:@"main"];
    }
    return _memoLabel;
}

- (MTImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [MTImageView new];
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_arrowImageView theme_setImageIdentifier:@"icon_setting_arrow" moduleName:@"main"];
    }
    return _arrowImageView;
}

- (MTView *)lineView {
    if (!_lineView) {
        _lineView = [MTView new];
        [_lineView theme_setBackgroundColorIdentifier:@"SettingController.cell.lineView.backgroundColor" moduleName:@"main"];
    }
    return _lineView;
}

#pragma mark - IBActions


#pragma mark - Public
+ (CGFloat)getCellHeightWithModel:(MTBaseModel *)model {
    return 44;
}

- (void)setModel:(MTBaseModel *)model {
    [super setModel:model];
    
    SettingModel *settingModel = (SettingModel *)model;
    [self.nameLabel theme_setTextIdentifier:settingModel.nameIdentifier moduleName:@"main"];
    self.memoLabel.text = settingModel.memo;
}

#pragma mark - Private
- (void)setupUI {
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.arrowImageView];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.contentView addSubview:self.memoLabel];
    [self.memoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowImageView.mas_left).offset(-24);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}

#pragma mark - Protocol conformance


@end
