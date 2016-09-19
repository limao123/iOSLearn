//
//  UIComponentsDemoViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/18.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UIComponentsDemoViewController.h"
#import "Masonry.h"
#import "UISegmentedControl+LTAdd.h"
#import "LTTextField.h"
#import "BlocksKit.h"
#import "BlocksKit+UIKit.h"

@interface UIComponentsDemoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation UIComponentsDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [self segmentedAndText];
    [self.scrollView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_top);
        make.height.equalTo(@300);
        make.bottom.equalTo(self.scrollView.mas_bottom);
        
        make.left.equalTo(self.scrollView.mas_left);
        make.right.equalTo(self.scrollView.mas_right);
        make.width.equalTo(@([[UIScreen mainScreen] bounds].size.width));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)segmentedAndText {
    UIView *view = [[UIView alloc] init];

    //选择器
    UISegmentedControl *pureSC = [[UISegmentedControl alloc] initWithItems:@[@"第一",@"第二"]];
    [pureSC setPureSegmentedControlWithStringAttribute:@[@{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor grayColor]},@{NSFontAttributeName : [UIFont boldSystemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor redColor]}]];
    [pureSC setSelectedSegmentIndex:0];
    [view addSubview:pureSC];

    //输入框
    LTTextField *textField = [[LTTextField alloc] init];
    textField.valueTextField.placeholder = @"请输入手机号";
    [view addSubview:textField];
    
    //指示标
    UIImageView *im = [[UIImageView alloc] init];
    im.image = [UIImage imageNamed:@"ic_denglu"];
    [view addSubview:im];

    
    //指示标位置
    CGFloat offset = (kScreenWidth-30)/4;
    
    //输入框约束
    [pureSC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(15);
        make.height.equalTo(@20);
        
        make.left.equalTo(view.mas_left).offset(15);
        make.right.equalTo(view.mas_right).offset(-15);
    }];
    
    [pureSC bk_addEventHandler:^(id sender) {
        UISegmentedControl *sc = (UISegmentedControl *)sender;
        NSInteger index = sc.selectedSegmentIndex;
        if (index == 0) {
            [im mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(pureSC.mas_centerX).offset(-offset);
            }];
        } else {
            [im mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(pureSC.mas_centerX).offset(offset);
            }];
        }
        
    } forControlEvents:UIControlEventValueChanged];
    
    //输入框约束
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pureSC.mas_bottom).offset(15);
        make.height.equalTo(@51);
        
        make.left.equalTo(view.mas_left).offset(15);
        make.right.equalTo(view.mas_right).offset(-15);
    }];
    
    //指示标约束
    [im mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@13);
        make.bottom.equalTo(textField.mas_top).offset(1);
        
        make.width.equalTo(@19);
        make.centerX.equalTo(pureSC.mas_centerX).offset(-offset);
    }];
    
    return view;
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
