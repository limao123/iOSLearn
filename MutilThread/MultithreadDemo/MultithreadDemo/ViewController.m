//
//  ViewController.m
//  MultithreadDemo
//
//  Created by bmob-LT on 16/3/17.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
#import "ImageData.h"

#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 100
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10

@interface ViewController ()
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) NSMutableArray *imageViews;
@property (strong,nonatomic) NSMutableArray *threads;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self solveThreadBlock];
//    [self mutilThread];
//    [self createThread];
//    [self multiThread];
    [self threadState];
//    [self runObjectThread];
}

//创建线程
- (void)createThread {
    //建立线程，可以带一个参数
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(runThread:) object:@"run thread"];
    NSLog(@"%@",[NSThread currentThread]);
    //使用线程
    [thread start];
    
//    [NSThread detachNewThreadSelector:@selector(runThread:) toTarget:self withObject:@"run thread"];
}

- (void)runThread:(id)object{
    NSLog(@"%@ %@",[NSThread currentThread],object);
}

//线程优先级
- (void)multiThread {
    for (int i = 0; i < 100; i++) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(runThread:) object:[NSNumber numberWithInt:i]];
        thread.name = [NSString stringWithFormat:@"thread %d",i,nil];
        //改变线程优先级，
        thread.threadPriority = i/(double)100;
        [thread start];
    }
}

- (void)runMultiThread:(NSNumber *)index{
    NSLog(@"thread %@",index);
}

//线程状态
- (void)threadState {
    //建立线程，可以带一个参数
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(runThreadState) object:nil];
    //使用线程
    [thread start];
}

- (void)runThreadState{
    NSThread *thread = [NSThread currentThread];
    //此处使用cancel并不会真正终止线程，仅仅是改变线程标识
    [thread cancel];
    if (thread.isCancelled) {
        NSLog(@"cancel");
        //只有调用exit方法才能终止线程
//        [NSThread exit];
    } else {
        //没有取消时继续做下载操作等
        NSLog(@"load data");
    }
    
    NSLog(@"打印说明线程没有终止");
}

//NSObject分类扩展方法
- (void)objectThread{
    [self performSelector:@selector(runObjectThread) withObject:nil];
}

- (void)runObjectThread{
    NSLog(@"run thread");
}

//其它
- (void)threadSleep{
    [NSThread sleepForTimeInterval:1];
}

# pragma mark - 多线程并发

- (void)multiThread1{
    _imageViews=[NSMutableArray array];
    for (int r=0; r<ROW_COUNT; r++) {
        for (int c=0; c<COLUMN_COUNT; c++) {
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(c*ROW_WIDTH+(c*CELL_SPACING), r*ROW_HEIGHT+(r*CELL_SPACING                           ), ROW_WIDTH, ROW_HEIGHT)];
            imageView.contentMode=UIViewContentModeScaleAspectFit;
            [self.view addSubview:imageView];
            [self.imageViews addObject:imageView];
        }
    }
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 500, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton.frame = CGRectMake(160, 500, 220, 25);
    [stopButton setTitle:@"停止加载" forState:UIControlStateNormal];
    [stopButton addTarget:self action:@selector(stopLoadImages) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
}



- (void)loadImageWithMultiThread1{
    self.threads = [NSMutableArray arrayWithCapacity:1];
    int count = ROW_COUNT *COLUMN_COUNT;
    for (int i = 0; i < count; i++) {
//        [NSThread detachNewThreadSelector:@selector(loadImages:) toTarget:self withObject:[NSNumber numberWithInt:i]];
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImages:) object:[NSNumber numberWithInt:i]];
        thread.name = [NSString stringWithFormat:@"thread %d",i,nil];
        thread.threadPriority = 1.0-(i/(double)100);
        [self.threads addObject:thread];
        [thread start];
    }
    

}

- (void)loadImages:(NSNumber *)index{
    //下载图片
    NSData *data = [self requestDataWithIndex:[index integerValue]];
    ImageData *imageData = [[ImageData alloc] init];
    imageData.data = data;
    imageData.index = [index integerValue];
    
    NSLog(@"%@",index);
    //在主线程更新imageView
    [self performSelectorOnMainThread:@selector(updataImageViews:) withObject:imageData waitUntilDone:YES];
}

- (NSData *)requestDataWithIndex:(NSInteger)index{
    if (index != COLUMN_COUNT * ROW_COUNT - 1) {
        [NSThread sleepForTimeInterval:3.0];
    }
    
    NSThread *thread = [NSThread currentThread];
    if (thread.isCancelled) {
        NSLog(@"%@ cancle",thread.name);
        [NSThread exit];
    }
    
    NSURL *url = [NSURL URLWithString:@"http://pic32.nipic.com/20130808/13407125_223749513154_2.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}


- (void)updataImageViews:(ImageData *)data{
    UIImageView *imageView = self.imageViews[data.index];
    imageView.image = [UIImage imageWithData:data.data];
    
}

- (void)stopLoadImages{
    for (NSThread *thread in self.threads) {
        if (!thread.isFinished) {
            //仅仅只是改变线程状态，并不是真正取消线程
            [thread cancel];
        }
    }
}

# pragma mark - 解决线程阻塞问题

- (void)solveThreadBlock{
    self.imageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [self.view addSubview:self.imageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 500, 220, 25)];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

//按键事件
- (void)loadImageWithMultiThread{
    //建立线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImage) object:nil];
    //启动线程，使用线程处于就绪状态
    [thread start];
    
    //使用类方法
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}

//加载图片
- (void)loadImage {
    //下载图片
    NSData *data = [self requestData];
    
    //在主线程更新imageView
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
}

- (NSData *)requestData{
    NSURL *url = [NSURL URLWithString:@"http://pic32.nipic.com/20130808/13407125_223749513154_2.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}

- (void)updateImage:(NSData *)imageData{
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
