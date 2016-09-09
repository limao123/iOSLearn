//
//  UIColor+LMColor.h
//  AddWechatFan
//
//  Created by 林涛 on 16/8/1.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(LMColor)

/**
 *  获取透明度为1的随机颜色
 *
 *  @return 随机获得的UIColor对象
 */
+ (UIColor *)randColor;

/**
 *  将16进制的颜色值转换成UIColor对象，透明度为1
 *
 *  @param colorStr 16进制表示的颜色（0xc36000,0Xc36000,#c36000或者c36000格式都支持）
 *
 *  @return 转换过后的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)colorStr;

/**
 *  将16进制的颜色值转换成UIColor对象
 *
 *  @param colorStr 16进制表示的颜色（0xc36000,0Xc36000,#c36000或者c36000格式都支持）
 *  @param alpha    透明度
 *
 *  @return 转换过后的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)colorStr alpha:(CGFloat)alpha;

/**
 *  返回(168，57,23)表示形式的UIColor
 *
 *  @param r 红，0～255
 *  @param g 绿，0～255
 *  @param b 蓝，0～255
 *  @param a 透明度，0～100
 *
 *  @return 转换过后UIColor对象
 */
+(UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
@end
