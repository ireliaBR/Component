//
//  BeautifulFIlterView.h
//  CameraModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "MTView.h"
@class BeautifulFilterView, GPUImageOutput;

@protocol GPUImageInput;

@protocol BeautifulFilterViewDelegate<NSObject>
-(void)beautifulFilterViewSelectedBtn:(BeautifulFilterView *)view filter:(GPUImageOutput<GPUImageInput> *)filter;
-(void)beautifulFilterViewCancelBtn:(BeautifulFilterView *)view filter:(GPUImageOutput<GPUImageInput> *)filter;
@end

/**
 美颜滤镜视图
 */
@interface BeautifulFilterView : MTView
@property(nonatomic,weak)id<BeautifulFilterViewDelegate> delegate;
@end
