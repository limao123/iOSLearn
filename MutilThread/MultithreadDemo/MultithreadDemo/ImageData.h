//
//  ImageDaata.h
//  MultithreadDemo
//
//  Created by bmob-LT on 16/7/4.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageData : NSObject
@property (assign,nonatomic) NSInteger index;
@property (strong, nonatomic) NSData *data;
@end
