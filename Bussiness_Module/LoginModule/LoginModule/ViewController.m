//
//  ViewController.m
//  LoginModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ViewController.h"


// 系统库头文件


// 第三方库头文件
@import MTRouter;

// 自定义模块的头文件


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *memoLabel;

@end

@implementation ViewController
#pragma mark - Lifecycle
+ (void)load {
    [MTRouter.router registerUrl:@"main://setUserInfo" handler:^id(NSDictionary *parameters) {
        ViewController *ctrl = (ViewController *)parameters[@"pushCtrl"];
        NSString *username = parameters[@"username"];
        NSString *password = parameters[@"password"];
        [ctrl setUsername:username password:password];
        return nil;
    }];
}
#pragma mark - Custom Accessors


#pragma mark - IBActions

- (IBAction)loginBtnClick:(id)sender {
    [MTRouter.router pushUrl:@"login://loginCtrl"
                  parameters:@{@"pushCtrl": self}
                    animated:YES
                 pushNavCtrl:self.navigationController];
}

#pragma mark - Public
- (void)setUsername:(NSString *)username password:(NSString *)password {
    self.loginBtn.hidden = YES;
    self.usernameLabel.hidden = NO;
    self.passwordLabel.hidden = NO;
    self.memoLabel.hidden = NO;
    
    self.usernameLabel.text = [NSString stringWithFormat:@"username: %@", username];
    self.passwordLabel.text = [NSString stringWithFormat:@"password: %@", password];
}

#pragma mark - Private


#pragma mark - Protocol conformance



@end
