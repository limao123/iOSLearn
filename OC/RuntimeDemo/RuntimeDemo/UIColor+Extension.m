//
//  UIColor+Extension.m
//  RuntimeDemo
//
//  Created by 林涛 on 16/8/20.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "UIColor+Extension.h"
#import <objc/runtime.h>

@implementation UIColor(Extension)

//1）使用临时全局变量来替代成员变量

//***临时变量***
//static NSString *_name;
//
//- (void)setName:(NSString *)name {
//    _name = name;
//}
//
//- (NSString *)name {
//    return _name;
//}

//2）使用runtime 关联对象 实现成员变量
- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self,@selector(name),name,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name{
    
    NSString *name = objc_getAssociatedObject(self, @selector(name));
    return name;
}
@end
