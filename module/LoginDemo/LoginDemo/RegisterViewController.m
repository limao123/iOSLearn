//
//  RegisterViewController.m
//  LoginDemo
//
//  Created by bmob-LT on 16/6/22.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "RegisterViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "BindMobilePhoneViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobilePhoneTf;

@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
@property (weak, nonatomic) IBOutlet UITextField *repeatPassworddTf;

@end

@implementation RegisterViewController

- (IBAction)registerButtonClicked:(id)sender {
    AVUser *user = [[AVUser alloc] init];
    user.username = self.mobilePhoneTf.text;
    user.password = self.passwordTf.text;
    user.mobilePhoneNumber = self.mobilePhoneTf.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            //注册成功，跳转绑定手机
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LoginAndRegister" bundle:nil];
            BindMobilePhoneViewController *bindMobilePhoneVC = [storyBoard instantiateViewControllerWithIdentifier:@"bindMobilePhoneVC"];
            [self.navigationController pushViewController:bindMobilePhoneVC animated:YES];
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
