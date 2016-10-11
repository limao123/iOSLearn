//
//  BK3MRCModel.h
//  LTKit
//
//  Created by bmob-LT on 2016/10/11.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int(^MyBlock)();

@interface BK3MRCModel : NSObject
@property (nonatomic,readwrite,strong) MyBlock block;
@end
