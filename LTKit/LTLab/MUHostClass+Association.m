//
//  MUHostClass+Association.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "MUHostClass+Association.h"
#import <objc/runtime.h>

@implementation MUHostClass (Association)

const static char kValueObject = '0';

- (void)setValueObject:(MUValueClass *)valueObject {
    objc_setAssociatedObject(self, &kValueObject, valueObject, OBJC_ASSOCIATION_ASSIGN);
    [valueObject setWeakReference:self forWipeSEL:@selector(setValueObject:)];
}

- (MUValueClass *)valueObject {
    return objc_getAssociatedObject(self, &kValueObject);
}

@end
