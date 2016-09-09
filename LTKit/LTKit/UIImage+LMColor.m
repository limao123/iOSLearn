//
//  UIImage+LMColor.m
//  AddWechatFan
//
//  Created by bmob-LT on 16/8/8.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UIImage+LMColor.h"

@implementation UIImage(LMColor)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
