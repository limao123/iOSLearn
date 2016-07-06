//
//  ViewController.m
//  GCDDemo
//
//  Created by bmob-LT on 16/7/6.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self serialSyn];
    [self serialAsyn];
//    [self concurrencySyn];
//    [self concurrencyAsyn];

}

//串行同步
- (void)serialSyn{
    NSLog(@"串行同步");
    dispatch_queue_t queue = dispatch_queue_create("serialSyn", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"task 1");
    });
    dispatch_sync(queue, ^{
        NSLog(@"task 2");
    });
    dispatch_sync(queue, ^{
        NSLog(@"task 3");
    });
}

//串行异步
- (void)serialAsyn{
    NSLog(@"串行异步");
    dispatch_queue_t queue = dispatch_queue_create("serialAsyn", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 1000000000; i++) {
//            for (NSUInteger i = 0; i < 1000000000; i++){}
        }
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 1");
    });
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 500000000; i++) {
            
        }
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 2");
    });
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 3");
    });
}

//并发同步
- (void)concurrencySyn{
     NSLog(@"并发同步");
    dispatch_queue_t queue = dispatch_queue_create("serialSyn", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        sleep(1);
         [self printThreadMsg];
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 1");
    });
    dispatch_sync(queue, ^{
        sleep(1);
        [self printThreadMsg];
        NSLog(@"task 2");
    });
    dispatch_sync(queue, ^{
        [self printThreadMsg];
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 3");
    });
}

//并发异步
- (void)concurrencyAsyn{
    NSLog(@"并发异步");
    dispatch_queue_t queue = dispatch_queue_create("serialSyn", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [self printThreadMsg];
        NSLog(@"task 1");
    });
    dispatch_async(queue, ^{
        [self printThreadMsg];
        NSLog(@"task 2");
    });
    dispatch_async(queue, ^{
        [self printThreadMsg];
        NSLog(@"task 3");
    });
}

- (void)printThreadMsg{
    NSThread *thread = [NSThread currentThread];
    if (thread.isMainThread) {
        NSLog(@"main thread %@",thread);
    } else {
        NSLog(@"%@",thread);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
