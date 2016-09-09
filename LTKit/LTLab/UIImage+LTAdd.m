//
//  UIImage+LTAdd.m
//  LTKit
//
//  Created by bmob-LT on 16/9/8.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UIImage+LTAdd.h"

@implementation UIImage (LTAdd)
- (UIImage *)imageWithCornerRadius:(CGFloat)radius sizeToFit:(CGSize)size{
    CGRect rect = (CGRect){0.f, 0.f, self.size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;

    
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
//    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
//    [self drawInRect:rect];
//    UIImage* image =     UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
}
@end
