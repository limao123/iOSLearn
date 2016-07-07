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
//    [self serialAsyn];
    [self concurrencySyn];
//    [self concurrencyAsyn];

}

//串行同步，在当前线程按进入顺序执行每一个任务
- (void)serialSyn{
    NSLog(@"串行同步");
    dispatch_queue_t queue = dispatch_queue_create("serialSyn", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        [self printThreadMsg];
        NSLog(@"task 1");
    });
    dispatch_sync(queue, ^{
        [self printThreadMsg];
        NSLog(@"task 2");
    });
    dispatch_sync(queue, ^{
        [self printThreadMsg];
        NSLog(@"task 3");
    });
}

/*
串行异步，在其它线程按进入顺序执行每一个任务，要注意的是，在串行队列中的异步任务会开辟一个新线
程执行，但并没有异步的效果，任务仍然会阻塞当前线程。跟我理解的不一样，我以为是不会开辟新线程，但
 任务不会阻塞当前线程，具体原因要看GCD是怎么实现的，初步估计是因为GCD的异步就是通过多线程来实现的。
 */
- (void)serialAsyn{

    NSLog(@"串行异步");
    dispatch_queue_t queue = dispatch_queue_create("serialAsyn", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 1000000000; i++) {
        }
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 1");
    });
    dispatch_async(queue, ^{
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

/*
 并发同步，直接在当前线程按顺序执行每一个任务，并不会开辟新线程，跟我理解的不太一样，我是以为会在
 多个线程中执行，只是这些任务是同步的。
 */
- (void)concurrencySyn{
     NSLog(@"并发同步");
    dispatch_queue_t queue = dispatch_queue_create("serialSyn", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
   
         [self printThreadMsg];
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 1");
    });
    dispatch_sync(queue, ^{
        [self printThreadMsg];
        NSLog(@"task 2");
    });
    dispatch_sync(queue, ^{
        [self printThreadMsg];
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"task 3");
    });
}

//并发异步，没有疑问，在1个或多个线程中执行
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

//打印当前线程消息
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
