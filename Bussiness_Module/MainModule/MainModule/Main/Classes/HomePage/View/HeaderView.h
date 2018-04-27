//
//  HeaderView.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/24.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>
@class HeaderView, MTButton;

@protocol HeaderViewDelegate <NSObject>
- (void)headerViewHeadBtnDidClick:(HeaderView *)headerView;
@end

/**
 main头视图
 */
@interface HeaderView : MTView
/**
 设置描述
 */
@property (nonatomic, copy) NSString *name;

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

@property (nonatomic, strong, readonly) MTButton *headBtn;
@end
