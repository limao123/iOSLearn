//
//  TabBarVC.m
//  ChineseSkill
//
//  Created by bmob-LT on 16/6/2.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleView.image = [UIImage imageNamed:@"navigation_logo"];
    self.navigationItem.titleView = titleView;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_showSetting"] style:UIBarButtonItemStyleDone target:self action:@selector(showSettingVC)];
}

- (void)showSettingVC{
    
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
