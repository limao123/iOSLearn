//
//  MyView.m
//  UIResponderChain
//
//  Created by 林涛 on 16/7/12.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%@",self.superview);
//    [self.superview touchesEnded:touches withEvent:event];
//        NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
//        [noti postNotificationName:@"resign" object:nil];
//}

- (UIResponder *)nextResponder{
    UIResponder *next = [super nextResponder];
    return next;
}
@end
