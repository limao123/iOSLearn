//
//  BNRContact.h
//  JSInteractionDemo
//
//  Created by bmob-LT on 16/8/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRContact : NSObject
@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *phone;
@property (copy,nonatomic) NSString *address;

+ (instancetype)contactWithName:(NSString *)name
                          phone:(NSString *)phone
                        address:(NSString *)address;
@end
