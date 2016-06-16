//
//  MyVIew.h
//  UIView
//
//  Created by bmob-LT on 16/5/31.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;


@interface MyView : UIView
@property (strong,nonatomic) Model *model;

+ (instancetype)appView;
+ (instancetype)appViewWithModel:(Model *)model;
@end
