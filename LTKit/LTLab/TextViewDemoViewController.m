//
//  TextViewDemoViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/9.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "TextViewDemoViewController.h"
#import "LTTextFiled.h"

@interface TextViewDemoViewController ()
@property (weak, nonatomic) IBOutlet LTTextFiled *defaultLTTf;
@property (weak, nonatomic) IBOutlet LTTextFiled *iconLTTf;
@property (weak, nonatomic) IBOutlet LTTextFiled *buttonLTTf;
@property (weak, nonatomic) IBOutlet LTTextFiled *iconAndButtonLTTf;
@property (weak, nonatomic) IBOutlet LTTextFiled *keyValueLTTf;
@property (weak, nonatomic) IBOutlet LTTextFiled *keyValueAndButtonLTTf;

@end

@implementation TextViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.defaultLTTf.valueTextField.placeholder = @"请输入手机号";
    
    self.iconLTTf.viewStyle = LTTextFieldStyleIcon;
    self.iconLTTf.icon.image = [UIImage imageNamed:@"ic_mima"];
    self.iconLTTf.valuePlacehold = @"输入密码";
    [self.iconLTTf.button setTitle:@"忘记密码" forState:UIControlStateNormal];
    
    self.buttonLTTf.viewStyle = LTTextFieldStyleButton;
    self.buttonLTTf.valuePlacehold = @"输入验证码";
    self.buttonLTTf.buttonStr = @"获取验证码";
    self.buttonLTTf.buttonStyle =  LTTextFieldButtonStyleSMSCode;
    self.buttonLTTf.buttonBlock = ^{
        NSLog(@"获取验证码时的逻辑");
    };
    
    self.iconAndButtonLTTf.viewStyle = LTTextFieldStyleIconAndButton;
    self.iconAndButtonLTTf.icon.image = [UIImage imageNamed:@"ic_mima"];
    self.iconAndButtonLTTf.valuePlacehold = @"输入密码";
    self.iconAndButtonLTTf.buttonStr = @"忘记密码";
    self.iconAndButtonLTTf.buttonBlock = ^{
        NSLog(@"点击跳转");
    };
    
    self.keyValueLTTf.viewStyle = LTTextFieldStyleKeyValue;
    self.keyValueLTTf.keyLabel.text = @"手机号";
    self.keyValueLTTf.valuePlacehold = @"请输入注册手机号";
    
    self.keyValueAndButtonLTTf.viewStyle = LTTextFieldStyleKeyValueAndButton;
    self.keyValueAndButtonLTTf.keyLabel.text = @"验证码";
    self.keyValueAndButtonLTTf.valuePlacehold = @"输入验证码";
    self.keyValueAndButtonLTTf.buttonStr = @"获取验证码";
    self.keyValueAndButtonLTTf.buttonStyle =  LTTextFieldButtonStyleSMSCode;
    self.keyValueAndButtonLTTf.buttonBlock = ^{
        NSLog(@"获取验证码时的逻辑");
    };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
