//
//  Student.m
//  RuntimeDemo
//
//  Created by 林涛 on 16/8/20.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//


#import "Student.h"

@interface Student (){
    //***声明成员变量***
//    NSString *_name;
}

@end

@implementation Student

//------------------自动----------------------//
//@synthesize
//
//编译器期间，让编译器自动生成getter/setter方法。
//
//当有自定义的存或取方法时，自定义会屏蔽自动生成该方法

//自动生成setter/getter方法

@synthesize name;
@synthesize nickname;


//------------------手动----------------------//

//@dynamic
//
//告诉编译器，不自动生成getter/setter方法，避免编译期间产生警告
//
//然后由自己实现存取方法

//实现Person中定义的属性name的set方法
//- (void)setName:(NSString *)name {
//    _name = name;
//    
//}
//
////实现Person中定义的属性name的get方法
//- (NSString *)name {
//    return _name;
//}

@end
