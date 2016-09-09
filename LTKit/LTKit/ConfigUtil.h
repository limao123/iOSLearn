//
//  ConfigUtil.h
//  AddWechatFan
//
//  Created by bmob-LT on 16/8/17.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigUtil : NSObject
+ (NSArray *)getJobArray;
+ (NSArray *)getAgeArray;
+ (NSArray *)getGenderArray;
+ (NSString *)getNameWithType:(NSString *)type andCode:(NSString *)code;
@end
