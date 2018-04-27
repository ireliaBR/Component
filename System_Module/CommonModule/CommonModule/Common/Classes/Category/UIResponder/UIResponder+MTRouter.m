//
//  UIResponder+MTRouter.m
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "UIResponder+MTRouter.h"

@implementation UIResponder (MTRouter)
-(void)routerEventWithName:(NSString *)eventName info:(id)info
{
    [[self nextResponder] routerEventWithName:eventName info:info];
}
@end
