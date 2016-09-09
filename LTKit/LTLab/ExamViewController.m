


//
//  ExamViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/2.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ExamViewController.h"

@interface ExamViewController ()
@property (strong,nonatomic) id observerOfExam56;
@end

@implementation ExamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self exam56];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)exam41 {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        //操作1
    });
    dispatch_group_async(group, queue, ^{
       //操作2
    });
    dispatch_group_notify(group, queue, ^{
       //所有操作完成后执行动作
    });
    
}

- (void)exam56 {
    [self exam56Receive];
    [self exam56Send];
}

- (void)exam56Send {
    //object表示是哪个对象发送的，userInfo表示携带的信息
    [[NSNotificationCenter defaultCenter] postNotificationName:@"observerOfExam56" object:nil userInfo:@{@"key":@"value"}];
}

- (void)exam56Receive {
    /*
    说明：我们上面用的  [NSNotificationCenter defaultCenter] 同一个实例，你也可以使用自己的 NSNotificationCenter，如：
    
    NSNotificationCenter *notificationCenter = [[NSNotificationCenter alloc]init];
    
    事件只会在当前的 NotificationCenter 中广播，不同的 NotificationCenter 之间的事件通知互不相干。
    */

    
    //表示会对哪个发送者对象发出的事件作出响应，nil 时表示接受所有发送者的事件。
     __weak typeof(self) weakSelf = self;
    self.observerOfExam56 = [[NSNotificationCenter defaultCenter] addObserverForName:@"observerOfExam56" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        NSLog(@"%@",note);
        
        __strong typeof(self) strongSelf = self;
        //user self
        //...

    }];
}

- (void)dealloc {
    if(self.observerOfExam56){
        [[NSNotificationCenter defaultCenter] removeObserver:self.observerOfExam56];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
