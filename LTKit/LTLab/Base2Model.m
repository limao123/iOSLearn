
//
//  Base2Model.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/11.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "Base2Model.h"

//@interface Base2Model (){
//    NSDate *_date2;
//}

//@end

@implementation Base2Model


- (NSDate *)date2 {
    return _date2;
}
//
//- (void)setDate2:(NSDate *)date2 {
//    _date2 = [NSDate date];
//}


- (instancetype)init {
    self = [super init];
    if (self) {
        _date1 = [NSDate date];
        _date2 = [NSDate date];
    }
    return self;
}

//- (void)releaseDate1 {
//    [self.date1 release];
//}
//
//- (void)releaseDate2 {
//    [self.date2 release];
//}
@end
