//
//  NSDate+MTExtension.h
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 NSDate拓展
 */
@interface NSDate (MTExtension)
/**
 date转string
 
 @param date 时间
 @param format 格式"yyyy-MM-dd HH:mm:ss"
 @return string
 */
+(NSString*)dateToString:(NSDate*)date format:(NSString*)format;

/**
 string转date
 
 @param string 时间
 @param format 格式"yyyy-MM-dd HH:mm:ss"
 @return string
 */
+(NSDate*)stringToDate:(NSString*)string format:(NSString*)format;


/**
 时间戳转换时间
 
 @param timeInterval 时间戳
 @return 时间
 */
+(NSDate*)timeIntervalToDate:(NSString*)timeInterval;
@end
