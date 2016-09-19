//
//  main.m
//  LTLab-masos
//
//  Created by bmob-LT on 16/9/19.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "TRPerson.h"
#import "NSArray+TRPerson.h"
#import "ClassOne.h"
#import "ClassTwo.h"
#import "AppleClass.h"

int main(int argc, const char * argv[]) {

    
    @autoreleasepool {
        // insert code here...
//        id obj = [NSObject alloc];
//        obj = [obj init];
        
        
//        TRPerson *person = [[TRPerson alloc] init];
//        unsigned int outCount = 0;
//        objc_property_t *propertyList = class_copyPropertyList([TRPerson class], &outCount);
//        for (int i = 0; i < outCount; i++) {
//            const char *name = property_getName(propertyList[i]);
//            const char *attribute = property_getAttributes(propertyList[i]);
//            NSLog(@"\nname = %s\nattribute = %s", name, attribute);
//        }
        
//        NSArray *array = @[@"Magic", @"Unique"];
//        TRPerson *person = [TRPerson new];
//        array.person = person;
//        NSLog(@"%@", array.person);
        
//        ClassOne *one = [ClassOne new];
//        ClassTwo *two = [ClassTwo new];
//        [one methodOne];
//        [two methodTwo];
//        Method method1 = class_getInstanceMethod([ClassTwo class], @selector(methodTwo));
//        Method method2 = class_getInstanceMethod([ClassOne class], @selector(methodOne));
//        method_exchangeImplementations(method1, method2);
//
//        [one methodOne];
//        [two methodTwo];
        
        AppleClass *appleClass = [AppleClass new];
        appleClass.name = @"I am a class created by Apple Inc.";
        NSLog(@"%@", appleClass.name);
    }
    return 0;
}
