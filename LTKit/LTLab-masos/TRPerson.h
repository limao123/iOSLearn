//
//  TRPerson.h
//  LTKit
//
//  Created by bmob-LT on 16/9/19.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPerson : NSObject

@property (nonatomic, copy, readonly) NSString *name;

@property (nonatomic, strong) NSObject *obj;

@property (nonatomic, weak, setter=resignIdentifier:) id identifier;

@property (nonatomic, assign, getter=isRight) BOOL boolValue;

@property (nonatomic, assign) CGFloat cgFloat;

@property (atomic, assign) CGRect cgRect;
@end
