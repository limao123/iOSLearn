//
//  BindMobilePhoneViewController.m
//  LoginDemo
//
//  Created by 林涛 on 16/6/22.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "BindMobilePhoneViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface BindMobilePhoneViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTf;
@property (weak, nonatomic) IBOutlet UITextField *smsCodeTf;

@end

@implementation BindMobilePhoneViewController

- (IBAction)bindPhoneNumberButtonClicked:(id)sender {
    [AVUser verifyMobilePhone:self.smsCodeTf.text withBlock:^(BOOL succeeded, NSError *error) {
        //验证结果
        if (succeeded) {
            NSLog(@"bind succeeded");
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
