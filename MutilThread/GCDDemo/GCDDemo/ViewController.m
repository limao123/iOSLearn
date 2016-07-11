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
    [self threadTest];
//    [self serialSyn];
//    [self serialAsyn];
//    [self concurrencySyn];
//    [self concurrencyAsyn];
//    [self deallock];
//    [self deadlock3];
//    [self deadlock4];

}

- (void)threadTest{
    [NSThread detachNewThreadSelector:@selector(serialSyn) toTarget:self withObject:nil];
}

//同步串行，在当前线程按进入顺序执行每一个任务
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
    NSLog(@"串行同步后");
}

/*
异步串行，异步不会阻塞当前代线程，此处就不会阻塞主线程，而三个任务是放在串行队列中，必须先完成上
 一个任务才会执行下一个任务。
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
同步并发，
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

- (void)deallock{
    NSLog(@"1"); // 任务1
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"2"); // 任务2
        NSLog(@"%@",[NSThread currentThread]);
    });
    NSLog(@"3"); // 任务3
}

- (void)deadlock3{
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1 %@",[NSThread currentThread]); // 任务1
    dispatch_async(queue, ^{
        NSLog(@"2 %@",[NSThread currentThread]); // 任务2
        dispatch_sync(queue, ^{
            NSLog(@"3 %@",[NSThread currentThread]); // 任务3
        });
        NSLog(@"4 %@",[NSThread currentThread]); // 任务4
    });
    NSLog(@"5 %@",[NSThread currentThread]); // 任务5
}

- (void)deadlock4{
    NSLog(@"1 %@",[NSThread currentThread]); // 任务1
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"2 %@",[NSThread currentThread]); // 任务2
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3 %@",[NSThread currentThread]); // 任务3
        });
        NSLog(@"4 %@",[NSThread currentThread]); // 任务4
    });
    NSLog(@"5 %@",[NSThread currentThread]); // 任务5
}

@end
