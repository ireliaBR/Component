//
//  HomePageController.h
//  MainModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <CommonModule/CommonModule.h>
#import <CommonModule/FadeBaseController.h>
/**
 首页
 */
@interface HomePageController : MTViewController

/**
 设置用户信息

 @param username username
 @param password password
 */
- (void)setUsername:(NSString *)username password:(NSString *)password;
@end
