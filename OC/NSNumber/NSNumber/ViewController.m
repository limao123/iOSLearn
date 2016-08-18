//
//  ViewController.m
//  NSNumber
//
//  Created by bmob-LT on 16/8/18.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    double a = 0.1;
    NSNumber *aNum = [NSNumber numberWithDouble:a];
    NSDictionary *dic = @{@"num":aNum};
    CGFloat b = [dic[@"num"] floatValue];
    
    NSLog(@"%f",b);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
