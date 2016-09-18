//
//  UIButton+LTAdd.m
//  LTKit
//
//  Created by bmob-LT on 16/9/18.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UIButton+LTAdd.h"
#import "UIColor+LTAdd.h"

@implementation UIButton (LTAdd)
- (void)setPureButtonWithTitle:(NSString *)title {
    self.layer.cornerRadius = 4;
    self.backgroundColor = [UIColor colorWithHexString:@"ff460b"];
    
    if (title.length == 0) {
        title = @"";
    }
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [self setAttributedTitle:attrStr forState:UIControlStateNormal];
}

- (void)setWeiXinButton {
    [self setImage:[UIImage imageNamed:@"ic_weixin_nor"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"ic_weixin_sel"] forState:UIControlStateSelected];
}
@end
