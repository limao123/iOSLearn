//
//  ViewController.m
//  MultithreadDemo
//
//  Created by bmob-LT on 16/3/17.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender{
    //获取当前线程，主线程
    NSThread *current = [NSThread currentThread];
    NSLog(@"btnClick---%@",%@);
    
    //使用C方法创建
    pthread_t thread;
    pthread_create(&thread, NULL, run, NULL);
}

void *run(void *data){
    NSThread *current = [NSThread currentThread];
    for (int i = 0; i < 10000; i++) {
        NSLog(@"btnCLick---%---%@",i,current);
    }
    return NULL;
}

@end
