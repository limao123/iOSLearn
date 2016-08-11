//
//  ViewController.m
//  NSArrayDemo
//
//  Created by bmob-LT on 16/8/11.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import "Wheel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray <Wheel*> *wheels = [[NSMutableArray alloc] initWithArray:@[[Wheel new],[Wheel new],@6]];
    [wheels addObject:@6];
    NSLog(@"%@",wheels);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
