
//
//  AppleClass+Modify.m
//  LTKit
//
//  Created by bmob-LT on 16/9/19.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "AppleClass+Modify.h"
#import <objc/runtime.h>

@implementation AppleClass (Modify)



+ (void)load {
    Method setName = class_getInstanceMethod([self class], @selector(setName:));
    Method mySetName = class_getInstanceMethod([self class], @selector(my_setName:));
    method_exchangeImplementations(setName, mySetName);
}

- (void)my_setName:(NSString *)name {
    NSLog(@"这是新的 setName: 方法");
    [self my_setName:name];
}
@end
