//
//  ViewController.m
//  NSOperationDemo
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
//    [self userNSInvocationOperation];
//    [self userNSBlockOperation];
//    [self setMaxConcurrentOperationCount];
    [self setOperaionOrder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

//NSInvocationOperation
- (void)userNSInvocationOperation{
    //标准用法
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(runNSInvocationOperation) object:nil];
    //将操作放进队列中运行，会另外开辟线程运行
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:invocationOperation];
    
    
}

- (void)userNSInvocationOperation1{
    //start，会在主线程中执行，一般不用访方法
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(runNSInvocationOperation) object:nil];
    [invocationOperation start];
    
}

- (void)userNSInvocationOperation2{
    //运行完的操作如果放进队列中会报错
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(runNSInvocationOperation) object:nil];
    [invocationOperation start];
    //将操作放进队列中运行，会另外开辟线程运行
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:invocationOperation];
}

- (void)runNSInvocationOperation {
    NSThread *thread = [NSThread currentThread];
    if (thread.isMainThread){
        NSLog(@"Main thread");
    } else {
        NSLog(@"Not main thread");
    }
    NSLog(@"runNSInvocationOperation");
}


//userNSBlockOperation
- (void)userNSBlockOperation{
    //创建操作队列
    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
    //方法1：创建操作块添加到队列
    //创建多线程操作
    NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"使用NSBlockOPeration进行添加");
    }];
    //添加到队列
    [operationQueue addOperation:blockOperation];
    
    //方法2：直接使用操队列添加操作
    [operationQueue addOperationWithBlock:^{
        NSLog(@"直接添加操作队列");
    }];
    
}

//setMaxConcurrentOperationCount
- (void)setMaxConcurrentOperationCount{
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.maxConcurrentOperationCount = 5;
    for (int i = 0; i < 100; i++) {
        [operationQueue addOperationWithBlock:^{
            sleep(1);
            NSLog(@"%d",i);
        }];
    }
}

- (void)setOperaionOrder{
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op1");
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op2");
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op3");
    }];
    
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    //循环依赖会造成这些互相依赖的操作都无法执行
//    [op1 addDependency:op3];
    [operationQueue addOperation:op1];
    [operationQueue addOperation:op2];
    [operationQueue addOperation:op3];
    
}


@end
