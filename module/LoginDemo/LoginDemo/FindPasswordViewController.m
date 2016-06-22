//
//  FindPasswordViewController.m
//  LoginDemo
//
//  Created by 林涛 on 16/6/22.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "FindPasswordViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface FindPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTf;
@property (weak, nonatomic) IBOutlet UITextField *smsCodeTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@property (weak, nonatomic) IBOutlet UITextField *repeatPasswordTf;

@end

@implementation FindPasswordViewController
- (IBAction)getSmsCodeButtonClicked:(id)sender {
    [AVUser requestPasswordResetWithPhoneNumber:self.phoneNumberTf.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"get sms code succeeded");
        } else {
            NSLog(@"%@",error);
        }
    }];
}

- (IBAction)modiftPaswordButtonClicked:(id)sender {
    [AVUser resetPasswordWithSmsCode:self.smsCodeTf.text newPassword:self.passwordTf.text block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"reset password succeeded");
        } else {
            NSLog(@"%@",error);
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
