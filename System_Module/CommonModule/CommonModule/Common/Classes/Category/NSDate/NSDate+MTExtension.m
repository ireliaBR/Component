//
//  NSDate+MTExtension.m
//  CommonModule
//
//  Created by 范冬冬 on 2018/4/23.
//  Copyright © 2018年 meitu. All rights reserved.
//

#import "NSDate+MTExtension.h"

static NSDateFormatter *dateFormatter = nil;

@implementation NSDate (MTExtension)

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
    });
}

+ (NSString*)dateToString:(NSDate*)date format:(NSString*)format {
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSDate *)stringToDate:(NSString *)string format:(NSString *)format {
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+ (NSDate *)timeIntervalToDate:(NSString *)timeInterval {
    int lengthSub = (int)(10 - timeInterval.length);
    NSTimeInterval time = timeInterval.doubleValue * pow(10, lengthSub);
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return date;
}
@end
