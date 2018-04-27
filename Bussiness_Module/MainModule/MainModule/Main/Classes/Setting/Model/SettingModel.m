//
//  SettingModel.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "SettingModel.h"

@implementation SettingModel
#pragma mark - Lifecycle
- (instancetype)initWithNameIdentifier:(NSString *)nameIdentifier
                                  memo:(NSString *)memo
                         routerAddress:(NSString *)routerAddress {
    self = [super init];
    if (self) {
        self.nameIdentifier = nameIdentifier;
        self.memo = memo;
        self.routerAddress = routerAddress;
    }
    return self;
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
