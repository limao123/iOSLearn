//
//  DismissKeyboard.m
//  AddWechatFan
//
//  Created by bmob-LT on 16/7/28.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "DismissKeyboard.h"





@implementation AppDelegate (DismissKeyboard)

/** 开启点击空白处隐藏键盘功能 */
- (void)openTouchOutsideDismissKeyboard{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addGesture) name:UIKeyboardDidShowNotification object:nil];
}

- (void)addGesture{
    [self.window addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disappearKeyboard)]];
}
- (void)disappearKeyboard {
    
    [self.window endEditing:YES];
    [self.window removeGestureRecognizer:self.window.gestureRecognizers.lastObject];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
