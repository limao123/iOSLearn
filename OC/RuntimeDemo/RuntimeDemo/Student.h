//
//  Student.h
//  RuntimeDemo
//
//  Created by 林涛 on 16/8/20.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Student : Person<PersonDelegate>
@property (nonatomic,copy) NSString *nickname;
@end
