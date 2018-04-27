//
//  LoginController.m
//  LoginModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "LoginController.h"

// 系统库头文件


// 第三方库头文件
#import <SVProgressHUD/SVProgressHUD.h>
@import MTRouter;
@import MTTheme;

// 自定义模块的头文件
#import "LoginPrefixHeader.h"
#import "LoginTextField.h"

@interface LoginController ()
@property (nonatomic, strong) MTImageView *logoImageView;
@property (nonatomic, strong) LoginTextField *usernameTextField;
@property (nonatomic, strong) LoginTextField *pwdTextField;
@property (nonatomic, strong) MTButton *loginBtn;
@end

@implementation LoginController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = LocalizedString(login.nav.title);
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.usernameTextField.textField becomeFirstResponder];
}

#pragma mark - Custom Accessors
- (MTImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [MTImageView new];
        _logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        _logoImageView.image = UIImageNamed(icon_login_logo);
        [self.view addSubview:_logoImageView];
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view).offset(40);
        }];
    }
    return _logoImageView;
}

- (LoginTextField *)usernameTextField {
    if (!_usernameTextField) {
        _usernameTextField = [LoginTextField new];
        _usernameTextField.memoLabel.text = @"+86";
        [_usernameTextField.textField theme_setPlaceholderIdentifier:@"LoginController.usernameTextField.placeholder" moduleName:@"login"];
        [self.view addSubview:_usernameTextField];
        [_usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(30);
            make.right.equalTo(self.view).offset(-30);
            make.top.equalTo(self.logoImageView.mas_bottom).offset(40);
        }];
    }
    return _usernameTextField;
}

- (LoginTextField *)pwdTextField {
    if (!_pwdTextField) {
        _pwdTextField = [LoginTextField new];
        [_pwdTextField.memoLabel theme_setTextIdentifier:@"LoginController.pwdMemoLabel.text" moduleName:@"login"];
        [_pwdTextField.textField theme_setPlaceholderIdentifier:@"LoginController.pwdTextField.placeholder" moduleName:@"login"];
        _pwdTextField.secureTextEntry = YES;
        [self.view addSubview:_pwdTextField];
        [_pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(30);
            make.right.equalTo(self.view).offset(-30);
            make.top.equalTo(self.usernameTextField.mas_bottom).offset(20);
        }];
    }
    return _pwdTextField;
}

- (MTButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [MTButton new];
        _loginBtn.titleLabel.font = MTFont(18);
        [_loginBtn theme_setTitleIdentifier:@"LoginController.loginBtn.text" forState:UIControlStateNormal moduleName:@"login"];
        [_loginBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _loginBtn.backgroundColor = UIColorFromRGB(0xff90a8);
        [_loginBtn theme_setBackgroundColorIdentifier:@"LoginController.loginBtn.backgroundColor" moduleName:@"login"];
        _loginBtn.layer.cornerRadius = 32;
        [self.view addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(30);
            make.right.equalTo(self.view).offset(-30);
            make.height.mas_equalTo(60);
            make.top.equalTo(self.pwdTextField.mas_bottom).offset(60);
        }];
        
        [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
#pragma mark - IBActions
- (void)loginBtnClick:(UIButton *)btn {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.pwdTextField.text;
    if (MTTrim(username).length == 0) {
        [SVProgressHUD showErrorWithStatus:LocalizedString(login.username.palceholder)];
        return;
    }
    
    if (MTTrim(username).length == 0) {
        [SVProgressHUD showErrorWithStatus:LocalizedString(login.pwd.placeholder)];
        return;
    }
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        
        BOOL usernameIsValid = ![username isEqualToString:@"Fdd"];
        BOOL pwdIsValid = ![password isEqualToString:@"fdd"];
        if (usernameIsValid || pwdIsValid) {
            [SVProgressHUD showErrorWithStatus:LocalizedString(login.result.error)];
            return;
        }
        UIViewController *pushCtrl = self.pushCtrl;
        [MTRouter.router executeUrl:@"main://setUserInfo"
                         parameters:NSDictionaryOfVariableBindings(pushCtrl, username, password)];
        
        [self.navigationController popViewControllerAnimated:YES];
    });
}

#pragma mark - Public


#pragma mark - Private
- (void)setupUI {
    [self logoImageView];
    [self usernameTextField];
    [self pwdTextField];
    [self loginBtn];
}

#pragma mark - Protocol conformance


@end
