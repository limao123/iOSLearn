//
//  ViewController.m
//  UIView
//
//  Created by bmob-LT on 16/5/31.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Model *model = [[Model alloc] init];
    model.icon = @"alien";
    model.name = @"alien";
    MyView *view = [MyView appViewWithModel:model];
    view.frame = CGRectMake(0, 0, 200, 400);
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
