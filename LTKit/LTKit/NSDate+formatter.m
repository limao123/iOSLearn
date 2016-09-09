//
//  NSDate+formatter.m
//  ProgrammerMeeting
//
//  Created by limao on 15/9/7.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import "NSDate+formatter.h"


@implementation NSDate(formatter)

- (NSString *)getStringWithFormat:(NSString *)format{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = format;
    NSString *year = [fmt stringFromDate:self];
    return year;
}

+ (NSDate *)getDateWithFormat:(NSString *)format andDateStr:(NSString *)dateStr{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = format;
    NSDate *date = [fmt dateFromString:dateStr];

    NSDate *localeDate = [NSDate convertSystemTimeZoneDate:date];
    return localeDate;
}

+ (NSDate *)convertSystemTimeZoneDate:(NSDate *)date{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}


@end
