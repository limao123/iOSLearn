

//
//  LTWeakClass.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "LTWeakClass.h"



@interface LTWeakClass ()
@property (nonatomic,copy) TaskBlock taskBlock;
@end

@implementation LTWeakClass

- (instancetype)initWithTaskBlock:(TaskBlock)taskBlock {
    self = [super init];
    if (self) {
        _taskBlock = taskBlock;
    }
    return self;
}


//在dealloc中调用block，依附的对象的宿主对象可以在些将自己置为nil
- (void)dealloc {
    if (self.taskBlock) {
        self.taskBlock();
    }
}

@end
