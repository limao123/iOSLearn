//
//  Person.h
//  RuntimeDemo
//
//  Created by 林涛 on 16/8/20.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonDelegate <NSObject>

@property (nonatomic, copy) NSString *name;

@end

@interface Person : NSObject

@end
