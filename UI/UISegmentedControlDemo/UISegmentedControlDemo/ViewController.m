//
//  ViewController.m
//  UISegmentedControlDemo
//
//  Created by bmob-LT on 16/8/8.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UISegmentedControl *sgc = [[UISegmentedControl alloc] initWithItems:@[@"item1",@"item2"]];
    sgc.frame = CGRectMake(0, 64, 100, 30);
    //设置选中的item
    [sgc setSelectedSegmentIndex:0];
    //设置选中事件
    [sgc addTarget:self action:@selector(sgcAction:) forControlEvents:UIControlEventValueChanged];
    //设置选中显示颜色
    sgc.tintColor = [UIColor greenColor];
    [self.view addSubview:sgc];
}

- (void)sgcAction:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:{
            NSLog(@"select item1");
        }
            break;
         
        case 1:{
            NSLog(@"select item2");
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
