//
//  NSObject+LTWeakTask.h
//  LTKit
//
//  Created by bmob-LT on 2016/10/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTWeakClass.h"

@interface NSObject (LTWeakTask)

//提供一个方法，使得宿主对象可以传递block给weakclass;
- (void)setWeakReferenceTask:(TaskBlock)taskBlock;
    


@end
