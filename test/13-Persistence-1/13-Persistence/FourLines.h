//
//  FourLines.h
//  13-Persistence
//
//  Created by 林涛 on 16/3/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FourLines : NSObject<NSCoding,NSCopying>
@property (copy, nonatomic) NSArray *lines;
@end
