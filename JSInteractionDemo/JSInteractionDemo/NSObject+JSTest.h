//
//  NSObject+JSTest.h
//  JSInteractionDemo
//
//  Created by bmob-LT on 16/8/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@interface NSObject(JSTest)
- (void)webView:(id)unuse didCreateJavaScriptContext:(JSContext *)ctx forFrame:(id)frame;
@end
