//
//  ConfigUtil.m
//  AddWechatFan
//
//  Created by bmob-LT on 16/8/17.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ConfigUtil.h"

@implementation ConfigUtil

+ (NSDictionary *)getConfigDic {
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"config.json"];
    NSURL *url=[NSURL fileURLWithPath:path];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *configDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return configDic;
}

+ (NSArray *)getAgeArray {
    NSDictionary *configDic = [[self class] getConfigDic];
    NSDictionary *ageDic = configDic[@"age"];
    NSArray *ageKeyArray = [[ageDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *ageArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 1; i < ageKeyArray.count; i++) {
        [ageArray addObject:ageDic[ageKeyArray[i]]];
    }
    
    [ageArray addObject:ageDic[@"0"]];
    
    return ageArray;
}

+ (NSArray *)getJobArray {
    NSDictionary *configDic = [[self class] getConfigDic];
    NSDictionary *jobDic = configDic[@"job"];
    NSArray *jobKeyArray = [[jobDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *jobArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 1; i < jobKeyArray.count; i++) {
        [jobArray addObject:jobDic[jobKeyArray[i]]];
    }
    
    [jobArray addObject:jobDic[@"0"]];
    
    return jobArray;
}

+ (NSArray *)getGenderArray {
    NSDictionary *configDic = [[self class] getConfigDic];
    NSDictionary *genderDic = configDic[@"gender"];
    NSArray *genderKeyArray = [[genderDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *genderArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 1; i < genderKeyArray.count; i++) {
        [genderArray addObject:genderDic[genderKeyArray[i]]];
    }
    return genderArray;
}

+ (NSString *)getNameWithType:(NSString *)type andCode:(NSString *)code {
    NSDictionary *configDic = [[self class] getConfigDic];
    NSDictionary *typeDic = configDic[type];
    NSString *name = typeDic[code];
    return name;
}

@end
