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

@interface UIComponentsDemoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation UIComponentsDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)segmentedAndText {
    UIView *view = [[UIView alloc] init];
    [self.scrollView addSubview:view];
    
    
    UISegmentedControl *pureSC = [[UISegmentedControl alloc] initWithItems:@[@"第一",@"第二"]];
    [pureSC setPureSegmentedControlWithStringAttribute:@[@{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor grayColor]},@{NSFontAttributeName : [UIFont boldSystemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor redColor]}]];
    [view addSubview:pureSC];
    
    
    UIImageView *im = [[UIImageView alloc] init];
    im.image = [UIImage imageNamed:@"ic_denglu"];
    [view addSubview:im];
    
    LTTextField *textField = [[LTTextField alloc] init];
    textField.valueTextField.placeholder = @"请输入手机号";
    [view addSubview:textField];
    
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
