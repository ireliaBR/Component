//
//  ThemeCell.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ThemeCell.h"

// 系统库头文件


// 第三方库头文件
#import <MTTheme/MTTheme.h>

// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "ThemeModel.h"

@interface ThemeCell()

///标题
@property (nonatomic, strong) MTLabel *nameLabel;
///是否选中图标
@property (nonatomic, strong) MTImageView *selectedImageView;
///下划线
@property (nonatomic, strong) MTView *lineView;
@end

@implementation ThemeCell
#pragma mark - Lifecycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView theme_setBackgroundColorIdentifier:@"ThemeController.cell.backgroundColor" moduleName:@"main"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupUI];
    }
    return self;
}

#pragma mark - Custom Accessors
- (MTLabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [MTLabel new];
        _nameLabel.font = MTFont(16);
        [_nameLabel theme_setTextColorIdentifier:@"ThemeController.cell.nameLabel.textColor"
                                      moduleName:@"main"];
    }
    return _nameLabel;
}

- (MTImageView *)selectedImageView {
    if (!_selectedImageView) {
        _selectedImageView = [MTImageView new];
        _selectedImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_selectedImageView theme_setImageIdentifier:@"icon_setting_selected" moduleName:@"main"];
    }
    return _selectedImageView;
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
    
    ThemeModel *themeModel = (ThemeModel *)model;
    self.nameLabel.text = themeModel.name;
    self.selectedImageView.hidden = !themeModel.isSelected;
}

#pragma mark - Private
- (void)setupUI {
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.selectedImageView];
    [self.selectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(30);
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
