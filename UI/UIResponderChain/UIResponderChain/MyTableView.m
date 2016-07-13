//
//  MyTableView.m
//  UIResponderChain
//
//  Created by 林涛 on 16/7/12.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "MyTableView.h"

@implementation MyTableView

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
////    NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
////    [noti postNotificationName:@"resign" object:nil];
//}

- (UIResponder *)nextResponder{
    UIResponder *next = [super nextResponder];
    return next;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    static UIEvent *e = nil;
//    
//    if (e != nil && e == event) {
//        e = nil;
//        return [super hitTest:point withEvent:event];
//    }
//    
//    e = event;
//    
//    if (event.type == UIEventTypeTouches) {
//        NSSet *touches = [event touchesForView:self];
//        UITouch *touch = [touches anyObject];
//        if (touch.phase == UITouchPhaseBegan) {
//            NSLog(@"Touches began");
//        }
//    }
//    return [super hitTest:point withEvent:event];
//}
@end
