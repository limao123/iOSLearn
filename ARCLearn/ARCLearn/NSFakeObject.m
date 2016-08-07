//
//  NSFakeObject.m
//  ARCLearn
//
//  Created by 林涛 on 16/8/6.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "NSFakeObject.h"

struct obj_layout {
    NSUInteger retained;
};

@implementation NSFakeObject


+ (id)alloc {
    int size = sizeof(struct obj_layout) + 100;
    struct obj_layout *p = (struct obj_layout *)calloc(1, size);
    return (id)(p+1);
}

@end
