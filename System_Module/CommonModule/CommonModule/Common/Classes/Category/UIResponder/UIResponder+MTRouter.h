//
//  UIResponder+MTRouter.h
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (MTRouter)

/**
 事件响应链传递方式，可参考：https://casatwy.com/responder_chain_communication.html

 @param eventName 事件名
 @param info 内容
 */
-(void)routerEventWithName:(NSString*)eventName info:(id)info;
@end
