//
//  BNRContact.m
//  JSInteractionDemo
//
//  Created by bmob-LT on 16/8/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "BNRContact.h"
#import <JavaScriptCore/JavaScriptCore.h>

@implementation BNRContact
+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone address:(NSString *)address
{
    if ([self isValidNumber:phone]) {
        BNRContact *contact = [BNRContact new];
        contact.name = name;
        contact.phone = phone;
        contact.address = address;
        return contact;
    } else {
        NSLog(@"Phone number %@ doesn't match format", phone);
        return nil;
    }
}

+ (BOOL)isValidNumber:(NSString *)phone
{
    // getting a JSContext
    JSContext *context = [JSContext new];
    
    // defining a JavaScript function
    NSString *jsFunctionText =
    @"var isValidNumber = function(phone) {"
    "    var phonePattern = /^[0-9]{3}[ ][0-9]{3}[-][0-9]{4}$/;"
    "    return phone.match(phonePattern) ? true : false;"
    "}";
    [context evaluateScript:jsFunctionText];
    
    // calling a JavaScript function
    //取得该方法
    JSValue *jsFunction = context[@"isValidNumber"];
    //调用该方法
    JSValue *value = [jsFunction callWithArguments:@[ phone ]];
    
    return [value toBool];
}
@end
