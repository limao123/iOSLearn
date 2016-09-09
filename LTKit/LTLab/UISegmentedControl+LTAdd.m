//
//  UISegmentedControl+LTAdd.m
//  LTKit
//
//  Created by bmob-LT on 16/9/1.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UISegmentedControl+LTAdd.h"

@implementation UISegmentedControl (LTAdd)
- (void)setPureSegmentedControlWithAttributeStrings:(NSArray<NSDictionary *> *)attributeStrings {
    self.tintColor = [UIColor clearColor];
    
    if (attributeStrings.count < 2) {
        // 正常状态下
        NSDictionary * normalTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor grayColor]};
        [self setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
        
        // 选中状态下
        NSDictionary * selctedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0f],NSForegroundColorAttributeName : [UIColor redColor]};
        [self setTitleTextAttributes:selctedTextAttributes forState:UIControlStateSelected];
    } else {
         [self setTitleTextAttributes:attributeStrings[0] forState:UIControlStateNormal];
         [self setTitleTextAttributes:attributeStrings[1] forState:UIControlStateSelected];
    }
    
    
}
@end
