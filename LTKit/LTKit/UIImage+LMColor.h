//
//  UIImage+LMColor.h
//  AddWechatFan
//
//  Created by bmob-LT on 16/8/8.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage(LMColor)

/**
 *  生成对应背景颜色的UIImage
 *
 *  @param color 需要的颜色
 *
 *  @return 对应背景颜色的UIImage对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
