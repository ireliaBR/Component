//
//  CameraShowAnimate.m
//  美颜相机
//
//  Created by ireliad on 2018/4/1.
//  Copyright © 2018年 正辰科技. All rights reserved.
//

#import "CameraShowAnimate.h"
#import "FadeBaseController.h"

@implementation CameraShowAnimate
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    FadeBaseController *fromCtrl = (FadeBaseController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toCtrl.view];
    [containerView addSubview:fromCtrl.view];
    
    [fromCtrl fadeAnimated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        [fromCtrl show];
    });
}
@end
