//
//  ProtocolClient.m
//  RuntimeDemo
//
//  Created by 林涛 on 16/8/20.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ProtocolClient.h"
#import "Person.h"
#import "Student.h"

@implementation ProtocolClient

+ (void)use {
    Student *student = [[Student alloc] init];
    student.name = @"彭爸爸";
    NSLog(@"%@", student.name);
}

@end
