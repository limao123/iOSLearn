//
//  Base2Model.h
//  LTKit
//
//  Created by bmob-LT on 2016/10/11.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base2Model : NSObject
@property (nonatomic,readwrite,assign) NSDate *date1;
@property (nonatomic,readwrite,weak) NSDate *date2;

//- (void)releaseDate1;
//- (void)releaseDate2;
@end
