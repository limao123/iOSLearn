//
//  MUValueClass.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "MUValueClass.h"

@interface MUValueClass (){
    /*
     __weak, __strong 用来修饰变量，此外还有 __unsafe_unretained, __autoreleasing 都是用来修饰变量的。
     __strong 是缺省的关键词。
     __weak 声明了一个可以自动 nil 化的弱引用。
     __unsafe_unretained 声明一个弱应用，但是不会自动nil化，也就是说，如果所指向的内存区域被释放了，这个指针就是一个野指针了。
     __autoreleasing 用来修饰一个函数的参数，这个参数会在函数返回的时候被自动释放。
     */
    __weak id _hostObj;
    SEL _hostWipeSEL;
}

@end

@implementation MUValueClass

- (void)setWeakReference:(id)hostObj forWipeSEL:(SEL)wipeSEL {
    _hostObj = hostObj;
    _hostWipeSEL = wipeSEL;
}

- (void)dealloc {
#pragma clang diagnostic push    // 创建取消警告域
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [_hostObj performSelector:_hostWipeSEL withObject:nil];
#pragma clang diagnostic pop    // 关闭取消警告域
}

@end
