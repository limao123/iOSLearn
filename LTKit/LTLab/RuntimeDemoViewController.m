//
//  RuntimeDemoViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/18.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "RuntimeDemoViewController.h"
#import <objc/runtime.h>
#import <objc/objc.h>

@interface RuntimeDemoViewController ()

@end

@implementation RuntimeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    id obj = [[NSObject alloc] init];
    
    Class c = [obj class];
    id other_obj = [[c alloc] init];
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
