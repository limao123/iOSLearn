
//
//  Mother.m
//  iOSInterviewQuestions
//
//  Created by 林涛 on 16/8/8.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "Mother.h"

@implementation Mother
- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@ release",self.name);
}
@end
