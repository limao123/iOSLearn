//
//  UIScrollView+UITouch.m
//  UIResponderChain
//
//  Created by bmob-LT on 16/7/13.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "UIScrollView+UITouch.h"

@implementation UIScrollView(UITouch)

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[self nextResponder] touchesEnded:touches withEvent:event];
//    [super touchesEnded:touches withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}
@end
