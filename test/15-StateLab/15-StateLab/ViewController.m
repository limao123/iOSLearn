//
//  ViewController.m
//  15-StateLab
//
//  Created by 林涛 on 16/3/7.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImage *smiley;
@property (strong, nonatomic) UIImageView *smileyView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@end

@implementation ViewController{
    BOOL animate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect bounds = self.view.bounds;
    CGRect labelFrame = CGRectMake(bounds.origin.x, CGRectGetMidY(bounds)-50, bounds.size.width,100);
    self.label = [[UILabel alloc] initWithFrame:labelFrame];
    self.label.font = [UIFont fontWithName:@"Helvetica" size:70];
    self.label.text = @"Bazinga!";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.label];
    
    CGRect smileyFrame = CGRectMake(CGRectGetMidX(bounds)-42,
                                    CGRectGetMidY(bounds)/2 - 42,
                                    84,84);
    self.smileyView = [[UIImageView alloc] initWithFrame:smileyFrame];
    self.smileyView.contentMode = UIViewContentModeCenter;
    NSString *smileyPath = [[NSBundle mainBundle] pathForResource:@"smiley" ofType:@"png"];
    self.smiley = [UIImage imageWithContentsOfFile:smileyPath];
    self.smileyView.image = self.smiley;
    [self.view addSubview:self.smileyView];
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"One",@"Two",@"Three",@"Four"]];
    self.segmentedControl.frame = CGRectMake(bounds.origin.x,50, bounds.size.width-40,30);
    [self.view addSubview:self.segmentedControl];
    //读取数据
    NSNumber *indexNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedIndex"];
    if (indexNumber) {
        NSInteger selectedIndex = [indexNumber intValue];
        self.segmentedControl.selectedSegmentIndex = selectedIndex;
    }
    
    //注册通知，在应用在不活跃时停止动画
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(applicationWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
    [center addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    //注册通知，在应用进入后台时释放资源
    [center addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [center addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];

    
}

- (void)applicationWillResignActive{
    NSLog(@"VC:%@",NSStringFromSelector(_cmd));
    animate = NO;
}

- (void)applicationDidBecomeActive{
    NSLog(@"VC: %@", NSStringFromSelector(_cmd));
    animate = YES;
    [self rotateLabelDown];
}

- (void)rotateLabelDown{
    [UIView animateWithDuration:0.5 animations:^{
        self.label.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        
        [self rotateLabelUp];
    }];
}

- (void)rotateLabelUp{
    [UIView animateWithDuration:0.5 animations:^{
        self.label.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished) {
        if (animate) {
            [self rotateLabelDown];
        }
        
    }];
}

- (void)applicationDidEnterBackground{
    NSLog(@"VC: %@",NSStringFromSelector(_cmd));
    UIApplication *app = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier taskId;
    
    taskId = [app beginBackgroundTaskWithExpirationHandler:^{
        //后台任务超时的处理
        NSLog(@"Background task ran out of time and was terminated.");
        [app endBackgroundTask:taskId];
    }];
    
    //系统没有分配足够时间
    if (taskId == UIBackgroundTaskInvalid) {
        NSLog(@"Failed to start background task!");
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Starting background task with %f seconds remaining",app.backgroundTimeRemaining);
        self.smiley = nil;
        self.smileyView.image = nil;
        
        NSInteger selectedIndex = self.segmentedControl.selectedSegmentIndex;
        [[NSUserDefaults standardUserDefaults] setInteger:selectedIndex forKey:@"selectedIndex"];
    });
    
    [NSThread sleepForTimeInterval:25];
    NSLog(@"Finishing background task with %f seconds remaining",app.backgroundTimeRemaining);
    
    //后台任务结束标记
    [app endBackgroundTask:taskId];

}

- (void)applicationWillEnterForeground{
    NSLog(@"VC: %@",NSStringFromSelector(_cmd));
    NSString *smileyPath = [[NSBundle mainBundle] pathForResource:@"smiley" ofType:@"png"];
    self.smiley = [UIImage imageWithContentsOfFile:smileyPath];
    self.smileyView.image = self.smiley;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
