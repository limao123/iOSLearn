//
//  NSObject+Association.h
//  LTKit
//
//  Created by bmob-LT on 2016/10/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Association)
- (void)setAssociatedObject:(id)object forKey:(NSString *)key;
- (id)getAssociatedObjectForKey:(NSString *)key;
@end
