//
//  NSDate+formatter.h
//  ProgrammerMeeting
//
//  Created by limao on 15/9/7.
//  Copyright (c) 2015年 Bmob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (formatter)

- (NSString *)getStringWithFormat:(NSString *)format;

+ (NSDate *)getDateWithFormat:(NSString *)format andDateStr:(NSString *)dateStr;
+ (NSDate *)convertSystemTimeZoneDate:(NSDate *)date;

@end
