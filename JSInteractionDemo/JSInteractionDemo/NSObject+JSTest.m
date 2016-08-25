//
//  NSObject+JSTest.m
//  JSInteractionDemo
//
//  Created by bmob-LT on 16/8/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "NSObject+JSTest.h"


@implementation NSObject(JSTest)
- (void)webView:(id)unuse didCreateJavaScriptContext:(JSContext *)ctx forFrame:(id)frame {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DidCreateContextNotification" object:ctx];
}
@end
