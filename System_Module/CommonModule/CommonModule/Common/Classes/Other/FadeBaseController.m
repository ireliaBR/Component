//
//  FadeBaseController.m
//  CameraModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "FadeBaseController.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "CommonPrefixHeader.h"

@interface FadeBaseController ()

@property(nonatomic,assign)NSInteger verticalCount;
@property(nonatomic,assign)NSInteger horizontalCount;
@property(nonatomic,assign)NSTimeInterval fadeDuration;
@property(nonatomic,assign)NSTimeInterval animationGapDuration;


@property(nonatomic,strong)UIView *allMaskView;
@property(nonatomic,strong)NSMutableArray<UIView*> *maskViews;
@end

@implementation FadeBaseController
#pragma mark - Lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    self.verticalCount = 3;
    self.horizontalCount = 12;
    self.fadeDuration = 0.5;
    self.animationGapDuration = 0.025;
    [self buildMaskView];
    
}


-(BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Custom Accessors
-(NSMutableArray<UIView *> *)maskViews {
    if (!_maskViews) {
        _maskViews = [[NSMutableArray alloc] init];
    }
    return _maskViews;
}

#pragma mark - IBActions


#pragma mark - Public
-(void)fadeAnimated:(BOOL)animated {
    if (animated) {
        for (int i=0;i<self.maskViews.count;i++) {
            UIView *view = self.maskViews[i];
            [UIView animateWithDuration:(self.fadeDuration <= 0.f ? 1.f : self.fadeDuration)
                                  delay:i * (self.animationGapDuration <= 0.f ? 0.2f : self.animationGapDuration)
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 
                                 view.alpha = 0.f;
                                 
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
    }else{
        for (UIView *view in self.maskViews) {
            view.alpha = 0.0;
        }
    }
}

-(void)show {
    for (UIView *view in self.maskViews) {
        view.alpha = 1.0;
    }
}

#pragma mark - Private
-(void)buildMaskView {
    if (self.verticalCount<1 ||self.horizontalCount<1) {
        return;
    }
    
    self.allMaskView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.view.maskView = self.allMaskView;
    
    CGFloat maskViewHeight = SCREEN_HEIGHT/self.verticalCount;
    CGFloat maskViewWidth = SCREEN_WIDTH/self.horizontalCount;
    
    for (int horizontal = 0; horizontal < self.horizontalCount; horizontal++) {
        for (int veritical = 0; veritical < self.verticalCount; veritical++) {
            CGRect frame = CGRectMake(maskViewWidth*horizontal, maskViewHeight*veritical, maskViewWidth, maskViewHeight);
            UIView *maskView = [[UIView alloc] initWithFrame:frame];
            maskView.backgroundColor = [UIColor blackColor];
            [self.allMaskView addSubview:maskView];
            [self.maskViews addObject:maskView];
        }
    }
}

#pragma mark - Protocol conformance


@end
