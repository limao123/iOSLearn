
//
//  MUHostClass+Association1.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "MUHostClass+Association1.h"
#import <objc/runtime.h>
#import "MUValueClass.h"
#import "NSObject+LTWeakTask.h"

const static char kValueObject = '0';

@implementation MUHostClass (Association1)

- (void)setValueObject:(MUValueClass *)valueObject {
    objc_setAssociatedObject(self, &kValueObject, valueObject, OBJC_ASSOCIATION_ASSIGN);
    /**
     *  1. 虽然这里没有循环引用，但是还是需要把弱引用丢给 block
     *       因为 valueObj 持有 weakTask，weakTask 持有 block，block 持有 self
     *       因此 self 至少要等到 valueObj 销毁后才能销毁。严重影响到 self 的生命周期
     *
     *    2. 而使用传递 block 的方式清空属性，而不是传递 set 方法的 SEL 的方式，是为了防止形成递归
     *    3. 第2点是我瞎说的
     */
    __weak typeof(self) wself = self;
    [valueObject setWeakReferenceTask:^{
        objc_setAssociatedObject(wself, &kValueObject, nil, OBJC_ASSOCIATION_ASSIGN);
    }];
}

- (MUValueClass *)valueObject {
    return objc_getAssociatedObject(self, &kValueObject);
}
@end
