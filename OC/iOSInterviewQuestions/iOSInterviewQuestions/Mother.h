//
//  Mother.h
//  iOSInterviewQuestions
//
//  Created by 林涛 on 16/8/8.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mother : NSObject
@property (strong,nonatomic) NSArray *childs;
@property (copy,nonatomic) NSString *name;
- (instancetype)initWithName:(NSString *)name;
@end
