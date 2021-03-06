//
//  OCECourse.m
//  OpenCourse
//
//  Created by Oneself on 16/6/1.
//  Copyright © 2016年 CCUT. All rights reserved.
//

#import "OCECourse.h"

@implementation OCECourse

- (NSString *)viewcount {
    return [NSString stringWithFormat:@"%@人观看", [self viewcountFormattedWithOriginalViewcount:_viewcount]];
}

- (NSString *)viewcountFormattedWithOriginalViewcount:(NSString *)originalViewcount {
    NSString *viewcountFormatted;
    if (originalViewcount.length < 5) {
        viewcountFormatted = originalViewcount;
    } else if (originalViewcount.length == 5) {
        viewcountFormatted = [NSString stringWithFormat:@"%c.%c万", [originalViewcount characterAtIndex:0], [originalViewcount characterAtIndex:1]];
    } else if (originalViewcount.length > 5) {
        viewcountFormatted = [NSString stringWithFormat:@"%@万", [originalViewcount substringToIndex:originalViewcount.length - 4]];
    } else
        AYLLog(@"%@", @"viewcountFormattedWithOriginalViewcount");
    
    return viewcountFormatted;
}

- (void)setDbCreateTime:(NSString *)dbCreateTime {
    // 请求返回的时间戳删除后三位(返回的时间戳后三位是000,不知道做什么的-_-!)
    NSString *timestamp = [dbCreateTime substringToIndex:dbCreateTime.length - 3];
    // 时间戳转日期
    _dbCreateTime = [[self dataStringWithTimestamp:timestamp] copy];
}

/**
 *  timestamp -> date (not mine)
 */
- (NSString *)dataStringWithTimestamp:(NSString *)timestamp {
    NSString *str = timestamp;
    NSTimeInterval time = [str doubleValue] + 28800;
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    NSString *dateStr = [dateFormatter stringFromDate:detailDate];
    
    return dateStr;
}

@end
