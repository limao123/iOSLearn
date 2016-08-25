//
//  MyJSObject.h
//  JSInteractionDemo
//
//  Created by bmob-LT on 16/8/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol PersonJSExport <JSExport>
- (void)nslog:(NSString *)str; //协议里面要声明调用的方法
@end

@interface MyJSObject : NSObject
- (void)nslog:(NSString *)str;
@end
