//
//  LTWeakClass.h
//  LTKit
//
//  Created by bmob-LT on 2016/10/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TaskBlock)();

@interface LTWeakClass : NSObject
- (instancetype)initWithTaskBlock:(TaskBlock)taskBlock;
@end
