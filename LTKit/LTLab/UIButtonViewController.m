//
//  UIButtonViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/18.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UIButtonViewController.h"
#import "UIColor+LTAdd.h"

@interface UIButtonViewController ()

@end

@implementation UIButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button1 = [self pureBackgroundButton];
    button1.frame = CGRectMake(30, 30+44, 200, 50);
    [self.view addSubview:button1];
    
    UIButton *button2 = [self weiXinButton];
    button2.frame = CGRectMake(30, 90+44, 50, 50);
    [self.view addSubview:button2];
    
    UIButton *button3 = [self pureTextButton];
    button3.frame = CGRectMake(30, 150+44, 100, 50);
    [self.view addSubview:button3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)pureBackgroundButton {
    UIButton *button  = [[UIButton alloc] init];
    button.layer.cornerRadius = 5;
    button.backgroundColor = [UIColor colorWithHexString:@"ff460b"];
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"纯色背影按钮" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [button setAttributedTitle:attrStr forState:UIControlStateNormal];
    return button;
}

- (UIButton *)weiXinButton {
    UIButton *weiXinBtn = [[UIButton alloc] init];
    [weiXinBtn setImage:[UIImage imageNamed:@"ic_weixin_nor"] forState:UIControlStateNormal];
    [weiXinBtn setImage:[UIImage imageNamed:@"ic_weixin_sel"] forState:UIControlStateHighlighted];
    return weiXinBtn;
}

- (UIButton *)pureTextButton {
    UIButton *pureTextButton = [[UIButton alloc] init];
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"纯色文字按钮" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"ebad55"],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    [pureTextButton setAttributedTitle:attrStr forState:UIControlStateNormal];
    return pureTextButton;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
