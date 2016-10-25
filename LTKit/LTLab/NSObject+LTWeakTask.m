
//
//  NSObject+LTWeakTask.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "NSObject+LTWeakTask.h"
#import <objc/runtime.h>

static const char kWeakTask = '0';

@implementation NSObject (LTWeakTask)

- (void)setWeakReferenceTask:(TaskBlock)taskBlock {
    LTWeakClass *weakClass = [[LTWeakClass alloc] initWithTaskBlock:taskBlock];
    objc_setAssociatedObject(self, &kWeakTask, weakClass, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
