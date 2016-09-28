


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
@property (strong,nonatomic) NSDate *exam46Now;
@end

@implementation ExamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self exam46];
//    [self exam55];
//    [self exam56];


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

- (void)exam46 {
    _exam46Now = [NSDate date];
    [self addObserver:self forKeyPath:@"exam46Now" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"1");
    [self willChangeValueForKey:@"exam46Now"]; // “手动触发self.exam46Now的KVO”，必写。
    NSLog(@"2");
//    [self didChangeValueForKey:@"exam46Now"]; // “手动触发self.exam46Now的KVO”，必写,不写不会产生回调，回调可能是在didChange中调用。
    NSLog(@"4");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"3");
}

- (void)exam52 {
    
}


- (void)exam54 {
    NSString *a = @"test";
    
}

- (void)exam55 {
    
    //po:打印对象的值,使用po view可以打印对象
    UIView *view = [[UIView alloc] init];
    
    //p:打印基础类型的值,使用 p a可以打印基础类型,也可以使用 po a，但只能看到值，使用p a可以看到更详细的信息
    int a = 5;
    
    
    //expr:动态执行指定表达式，expr b = 3，下面的打印语句会输出3
    int b = 2;
    NSLog(@"%d",b);
    
    //call:call即是调用的意思。其实上述的po和p也有调用的功能。因此一般只在不需要显示输出，或是方法无返回值时使用call
    //call [self.view setBackgroundColor:[UIColor redColor]] 执行后背景将变成红色
    
    //image:image 命令可用于寻址，有多个组合命令。比较实用的用法是用于寻找栈地址对应的代码位置。
//    NSArray *arr=[[NSArray alloc] initWithObjects:@"1",@"2", nil];
//    NSLog(@"%@",arr[2]);
    
    
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

- (void)exam56 {
    [self exam56Receive];
    [self exam56Send];
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
