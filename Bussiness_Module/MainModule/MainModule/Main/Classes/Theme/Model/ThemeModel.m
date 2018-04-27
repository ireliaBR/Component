//
//  ThemeModel.m
//  MainModule
//
//  Created by 范冬冬 on 2018/4/26.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "ThemeModel.h"

@implementation ThemeModel
#pragma mark - Lifecycle
- (instancetype)initWithName:(NSString *)name isSelected:(BOOL)isSelected {
    self = [super init];
    if (self) {
        self.name = name;
        self.isSelected = isSelected;
    }
    return self;
}

#pragma mark - Custom Accessors


#pragma mark - IBActions


#pragma mark - Public


#pragma mark - Private


#pragma mark - Protocol conformance

@end
