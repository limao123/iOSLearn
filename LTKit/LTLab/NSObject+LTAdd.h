//
//  NSObject+LTAdd.h
//  LTKit
//
//  Created by bmob-LT on 16/9/28.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PGObservingBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);

@interface NSObject (LTAdd)
- (void)PG_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(PGObservingBlock)block;

- (void)PG_removeObserver:(NSObject *)observer forKey:(NSString *)key;
@end
