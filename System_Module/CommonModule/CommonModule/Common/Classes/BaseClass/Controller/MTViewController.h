//
//  MTViewController.h
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Controller基类
 */
@interface MTViewController : UIViewController

/**
 nav回退按钮事件，可重写
 */
-(void)backBtnItemClick;
@end
