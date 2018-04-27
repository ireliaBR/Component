//
//  MTBaseViewModel.m
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTBaseViewModel.h"

@implementation UIViewController(ViewModel)

- (void)callBackAction{
    [self callBackAction:0 info:nil];
}

- (void)callBackAction:(FDViewControllerAction)action{
    [self callBackAction:action info:nil];
}

- (void)callBackAction:(FDViewControllerAction)action info:(id)info{
}

@end

@implementation MTBaseViewModel

+ (instancetype)modelWithViewController:(UIViewController *)viewController{
    MTBaseViewModel *viewModel = self.new;
    if (viewModel) {
        viewModel.viewController = viewController;
    }
    return viewModel;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"View model:%@ viewController:%@",
            super.description,
            self.viewController.description
            ];
}

@end
