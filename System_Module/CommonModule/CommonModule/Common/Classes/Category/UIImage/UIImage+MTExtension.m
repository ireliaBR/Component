//
//  UIImage+MTExtension.m
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "UIImage+MTExtension.h"

@implementation UIImage (MTExtension)

+(UIImage *)imageNamed:(NSString *)imageNamed withBundlePath:(NSString *)bundlePath {
    NSURL *bundleUrl = [NSURL fileURLWithPath:bundlePath];
    NSBundle *imageBundle = [NSBundle bundleWithURL:bundleUrl];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [UIImage imageNamed:imageNamed inBundle:imageBundle compatibleWithTraitCollection:nil];
#else
    return [UIImage imageWithContentsOfFile:[imageBundle pathForResource:imageNamed ofType:@"png"]];
#endif
}

-(UIImage *)transformToSize:(CGSize)newsize {
    // 创建一个bitmap的context
    UIGraphicsBeginImageContext(newsize);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0,0, newsize.width, newsize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *transformedImg = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return transformedImg;
}

-(UIImage *)scale:(CGFloat)scale {
    CGSize scaleSize = CGSizeMake(self.size.width*scale, self.size.height*scale);
    return [self transformToSize:scaleSize];
}
@end
