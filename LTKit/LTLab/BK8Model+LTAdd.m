

//
//  BK8Model+LTAdd.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "BK8Model+LTAdd.h"
#import <objc/runtime.h>
#import "NSObject+Association.h"

@implementation BK8Model (LTAdd)
- (void)setAddProperty:(NSObject *)addProperty {
    [self setAssociatedObject:addProperty forKey:@"addProperty"];
}

- (NSObject *)addProperty {
    return [self getAssociatedObjectForKey:@"addProperty"];
}
@end
