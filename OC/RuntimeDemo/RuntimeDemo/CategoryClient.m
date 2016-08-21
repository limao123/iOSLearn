
//
//  CategoryClient.m
//  RuntimeDemo
//
//  Created by 林涛 on 16/8/20.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "CategoryClient.h"
#import "UIColor+Extension.h"

@implementation CategoryClient
+ (void)use {
    UIColor *color = [UIColor whiteColor];
    color.name = @"whiteColor";
    NSLog(@"%@",color.name);
}
@end
