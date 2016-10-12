



//
//  BK5Model.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/12.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "BK5Model.h"

@implementation BK5Model{
    NSMutableSet *_friends;
}

- (void)setName:(NSString *)name {
    _name = [name copy];
}

- (instancetype)initWithName:(NSString *)name
                         age:(NSUInteger)age
                         sex:(CYLSex)sex {
    if(self = [super init]) {
        _name = [name copy];
        _age = age;
        _sex = sex;
        _friends = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addFriend:(BK5Model *)user {
    [_friends addObject:user];
}

- (void)removeFriend:(BK5Model *)user {
    [_friends removeObject:user];
}

- (id)copyWithZone:(NSZone *)zone {
    BK5Model *copy = [[[self class] allocWithZone:zone]
                     initWithName:_name
                     age:_age
                     sex:_sex];
    copy->_friends = [_friends mutableCopy];
    return copy;
}



@end
