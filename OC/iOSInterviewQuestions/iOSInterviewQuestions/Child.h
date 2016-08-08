//
//  Child.h
//  iOSInterviewQuestions
//
//  Created by 林涛 on 16/8/8.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Father.h"
#import "Mother.h"

@interface Child : NSObject
@property (weak,nonatomic) Father *father;
@property (strong,nonatomic) Mother *mother;
@property (copy,nonatomic) NSString *name;
- (instancetype)initWithName:(NSString *)name;
@end
