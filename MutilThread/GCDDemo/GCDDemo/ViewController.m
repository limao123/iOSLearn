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
//    [self threadTest];
//    [self serialSyn];
//    [self concurrencySyn];
//        [self serialAsyn];
//    [self concurrencyAsyn];
//    [self test];
//    [self deadlock1];
    [self deadlock3];
//    [self deadlock4];

}

- (void)threadTest{
    [NSThread detachNewThreadSelector:@selector(serialSyn) toTarget:self withObject:nil];
}

//串行同步，在当前线程按进入顺序执行每一个任务
- (void)serialSyn{
    dispatch_queue_t queue = dispatch_queue_create("serialSyn", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t task1 = ^{
        NSLog(@"task1 run");
    };
    dispatch_sync(queue,task1);
    
    dispatch_block_t task2 =  ^{
        NSLog(@"task2 run");
    };
    dispatch_sync(queue,task2);
    
    dispatch_block_t task3 =  ^{
        NSLog(@"task3 run");
    };
    dispatch_sync(queue, task3);
}

/*
 并发同步
 */
- (void)concurrencySyn{
    dispatch_queue_t queue = dispatch_queue_create("concurrencySyn", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_block_t task1 = ^{
        NSLog(@"task1 run");
    };
    dispatch_sync(queue,task1);
    
    dispatch_block_t task2 = ^{
        NSLog(@"task2 run");
    };
    dispatch_sync(queue,task2);
    
    dispatch_block_t task3 = ^{
        NSLog(@"task3 run");
    };
    dispatch_sync(queue, task3);
}

/*
串行异步，异步不会阻塞当前代线程，此处就不会阻塞主线程，而三个任务是放在串行队列中，必须先完成上
 一个任务才会执行下一个任务。
 */
- (void)serialAsyn{
    dispatch_queue_t queue = dispatch_queue_create("serialAsyn", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t task1 = ^{
        NSLog(@"task1 run");
    };
    dispatch_async(queue,task1);
    
    dispatch_block_t task2 =  ^{
        NSLog(@"task2 run");
    };
    dispatch_async(queue,task2);
    
    dispatch_block_t task3 =  ^{
        NSLog(@"task3 run");
    };
    dispatch_async(queue, task3);
}



//并发异步，没有疑问，在1个或多个线程中执行
- (void)concurrencyAsyn{
    dispatch_queue_t queue = dispatch_queue_create("concurrencyAsyn", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_block_t task1 = ^{
        NSLog(@"task1 run");
    };
    dispatch_async(queue,task1);
    
    dispatch_block_t task2 = ^{
        NSLog(@"task2 run");
    };
    dispatch_async(queue, task2);
    
    dispatch_block_t task3 = ^{
        NSLog(@"task3 run");
    };
    dispatch_async(queue,task3);
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

- (void)systemQueue{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t systemQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test{
    [NSThread detachNewThreadSelector:@selector(deadlock1) toTarget:self withObject:nil];
}

- (void)deadlock1{
    
//    NSLog(@"1");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2");
//    });
//    NSLog(@"3");
    
    NSLog(@"1");
    dispatch_block_t task =  ^{
        NSLog(@"2");
    };
    dispatch_sync(dispatch_get_main_queue(),task);
    NSLog(@"3");
}

- (void)deadlock3{
//    dispatch_queue_t queue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"1");
//    dispatch_async(queue, ^{
//        NSLog(@"2");
//        dispatch_sync(queue, ^{
//            NSLog(@"3");
//        });
//        NSLog(@"4");
//    });
//    NSLog(@"5");
    
    dispatch_queue_t queue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_block_t task = ^{
         NSLog(@"2");
        dispatch_block_t inTask =  ^{
            NSLog(@"3");
        };
        dispatch_sync(queue,inTask);
        NSLog(@"4");
    };
    dispatch_async(queue,task);
    NSLog(@"5");
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
