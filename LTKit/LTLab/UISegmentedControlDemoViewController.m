//
//  UISegmentedControlDemoViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/2.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UISegmentedControlDemoViewController.h"
#import "UISegmentedControl+LTAdd.h"

@interface UISegmentedControlDemoViewController ()

@end

@implementation UISegmentedControlDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISegmentedControl *pureSC = [[UISegmentedControl alloc] initWithItems:@[@"第一",@"第二"]];
    [pureSC setFrame:CGRectMake(10, 84, 100, 100)];
    [pureSC setPureSegmentedControlWithStringAttribute:@[@{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor grayColor]},@{NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0f],NSForegroundColorAttributeName : [UIColor redColor]}]];
    [self.view addSubview:pureSC];
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
