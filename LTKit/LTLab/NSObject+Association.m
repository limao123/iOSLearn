

//
//  NSObject+Association.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "NSObject+Association.h"
#import <objc/runtime.h>

static NSMutableDictionary *keyBuffer;

@implementation NSObject (Association)

+ (void)load {
    keyBuffer = [NSMutableDictionary dictionary];
}

- (void)setAssociatedObject:(id)object forKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey == NULL) {
        cKey = key.UTF8String;
        keyBuffer[key] = [NSValue valueWithPointer:cKey];
    }
    
    objc_setAssociatedObject(self, cKey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)getAssociatedObjectForKey:(NSString *)key {
    const char *cKey = [keyBuffer[key] pointerValue];
    if (cKey == NULL) {
        return nil;
    } else {
        return objc_getAssociatedObject(self, cKey);
    }
}

@end
