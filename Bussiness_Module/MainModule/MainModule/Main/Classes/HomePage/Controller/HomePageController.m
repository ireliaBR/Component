//
//  HomePageController.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "HomePageController.h"

// 系统库头文件


// 第三方库头文件
@import MTRouter;

// 自定义模块的头文件
#import "MainPrefixHeader.h"
#import "CameraButton.h"
#import "HeaderView.h"

@interface HomePageController () <HeaderViewDelegate>

@property (nonatomic, strong) HeaderView *headerView;
/**
 拍照按钮
 */
@property (nonatomic, strong) CameraButton *cameraBtn;

///用户名
@property (nonatomic, copy) NSString *username;
///密码
@property (nonatomic, copy) NSString *password;
@end

@implementation HomePageController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);

    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Custom Accessors
- (HeaderView *)headerView {
    if (!_headerView) {
        _headerView = [HeaderView new];
        _headerView.delegate = self;
        [self.view addSubview:_headerView];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_equalTo(280);
        }];
    }
    return _headerView;
}

- (CameraButton *)cameraBtn {
    if (!_cameraBtn) {
        _cameraBtn = [CameraButton new];
        
        [self.view addSubview:_cameraBtn];
        [_cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-50-BOTTOM_SAFE_HEIGHT);
            make.width.height.mas_equalTo(115);
        }];
        
        [_cameraBtn addTarget:self action:@selector(cameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}


#pragma mark - IBActions
- (void)cameraBtnClick:(UIButton *)btn {
    [MTRouter.router presentUrl:@"camera://cameraCtrl" animated:YES presentCtrl:self];
}

#pragma mark - Public
- (void)setUsername:(NSString *)username password:(NSString *)password {
    self.username = username;
    self.password = password;
    
    self.headerView.headBtn.selected = YES;
    
    self.headerView.name = username;
}

#pragma mark - Private
- (void)setupUI {
    [self headerView];
    [self cameraBtn];
}

#pragma mark - Protocol conformance
#pragma mark - HeaderViewDelegate
- (void)headerViewHeadBtnDidClick:(HeaderView *)headerView {
    if (headerView.headBtn.isSelected) {
        [MTRouter.router pushUrl:@"main://settingCtrl"
                      animated:YES
                     pushNavCtrl:self.navigationController];
    } else {
        [MTRouter.router pushUrl:@"login://loginCtrl"
                      parameters:@{@"pushCtrl": self}
                        animated:YES
                     pushNavCtrl:self.navigationController];
    }
}

@end
