//
//  MTBaseViewModel.h
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NSUInteger FDViewControllerAction;

@interface UIViewController(ViewModel)

/**
 Controller回调
 */
- (void)callBackAction;

- (void)callBackAction:(FDViewControllerAction)action;

- (void)callBackAction:(FDViewControllerAction)action info:(id)info;

@end

/**
 ViewModel基类
 */
@interface MTBaseViewModel : NSObject
@property (nonatomic,weak) UIViewController *viewController;

+ (instancetype)modelWithViewController:(nonnull UIViewController *)viewController;
@end
