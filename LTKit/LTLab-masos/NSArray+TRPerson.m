//
//  NSArray+TRPerson.m
//  LTKit
//
//  Created by bmob-LT on 16/9/19.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "NSArray+TRPerson.h"
#import <objc/runtime.h>

@implementation NSArray (TRPerson)
- (void)setPerson:(TRPerson *)person {
    objc_setAssociatedObject(self, "person", person, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (TRPerson *)person {
    return objc_getAssociatedObject(self, "person");
}
@end
