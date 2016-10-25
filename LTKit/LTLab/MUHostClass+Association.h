//
//  MUHostClass+Association.h
//  LTKit
//
//  Created by bmob-LT on 2016/10/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "MUHostClass.h"
#import "MUValueClass.h"

@interface MUHostClass (Association)
@property (nonatomic,weak) MUValueClass *valueObject;
@end
