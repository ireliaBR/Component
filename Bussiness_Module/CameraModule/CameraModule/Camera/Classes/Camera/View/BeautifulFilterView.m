//
//  BeautifulFIlterView.m
//  CameraModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "BeautifulFilterView.h"

// 系统库头文件


// 第三方库头文件
#import <GPUImage/GPUImage.h>

// 自定义模块的头文件
#import "CameraPrefixHeader.h"
#import "GPUImageBeautifyFilter.h"

@interface BeautifulFilterView()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSDictionary<NSString*, GPUImageOutput<GPUImageInput>*> *data;
@property(nonatomic,strong)NSMutableArray<UIButton*> *btns;

@end


@implementation BeautifulFilterView

#pragma mark - Lifecycle
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        [self scrollView];
        [self initUI];
    }
    return self;
}

#pragma mark - Custom Accessors
-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self);
            make.height.mas_equalTo(80);
            make.bottom.equalTo(self).offset(-100);
        }];
    }
    return _scrollView;
}

-(NSDictionary<NSString *,GPUImageOutput<GPUImageInput> *> *)data
{
    if (!_data) {
        _data = @{
                  @"素描": [GPUImageSketchFilter new],
                  @"卡通效果": [GPUImageToonFilter new],
                  @"水晶球效果": [GPUImageGlassSphereFilter new],
                  @"浮雕效果": [GPUImageEmbossFilter new],
                  @"磨皮": [GPUImageBeautifyFilter new],
                  };
    }
    return _data;
}

-(NSMutableArray<UIButton *> *)btns
{
    if (!_btns) {
        _btns = [[NSMutableArray alloc] init];
    }
    return _btns;
}

#pragma mark - IBActions
-(void)btnClick:(UIButton*)btn
{
    NSString *key = [btn titleForState:UIControlStateNormal];
    GPUImageOutput<GPUImageInput> *filter = self.data[key];
    if (btn.selected) {
        if ([self.delegate respondsToSelector:@selector(beautifulFilterViewCancelBtn:filter:)]) {
            [self.delegate beautifulFilterViewCancelBtn:self filter:filter];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(beautifulFilterViewSelectedBtn:filter:)]) {
            [self.delegate beautifulFilterViewSelectedBtn:self filter:filter];
        }
    }
    
    btn.selected = !btn.selected;
    [self.btns enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj != btn) {
            obj.selected = NO;
        }
    }];
    
    
}

#pragma mark - Public


#pragma mark - Private
-(void)initUI
{
    NSArray<NSString*> *keys = self.data.allKeys;
    
    for (int i=0; i<keys.count; i++) {
        NSString *key = keys[i];
        UIButton *btn = [UIButton new];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:key forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self.scrollView addSubview:btn];
        [self.btns addObject:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.btns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
    [self.btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:30 tailSpacing:30];
}

#pragma mark - Protocol conformance


@end
