//
//  MTViewController.m
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTViewController.h"

// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "CommonPrefixHeader.h"

@interface MTViewController ()

@end

@implementation MTViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    printf("加载: %s 类\n", [[[self class] description] UTF8String]);
    
    [self setBackItem];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    printf("进入: %s 类\n", [[[self class] description] UTF8String]);
    
    //设置手势回退
    if (self.navigationController.viewControllers.count != 1) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    printf("离开: %s 类\n", [[[self class] description] UTF8String]);
}

- (void)dealloc {
    printf("卸载: %s 类\n", [[[self class] description] UTF8String]);
}

#pragma mark - Custom Accessors


#pragma mark - IBActions
- (void)backBtnItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Public


#pragma mark - Private
-(void)setBackItem {
    if (self.navigationController.viewControllers.count > 1) {
        UIImage *image = CommonModuleUIImageNamed(@"icon_common_nav_arrow");
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(backBtnItemClick)];
    } else {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

#pragma mark - Protocol conformance


@end
