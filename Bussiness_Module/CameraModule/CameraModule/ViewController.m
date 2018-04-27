//
//  ViewController.m
//  CameraModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ViewController.h"


// 系统库头文件


// 第三方库头文件


// 自定义模块的头文件
#import "CameraController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle


#pragma mark - Custom Accessors


#pragma mark - IBActions

- (IBAction)cameraBtnClick:(id)sender {
    CameraController *cameraCtrl = [CameraController new];
    [self presentViewController:cameraCtrl animated:YES completion:nil];
}

#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance



@end
