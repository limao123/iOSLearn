//
//  ViewController.m
//  15-SlowWorker
//
//  Created by 林涛 on 16/3/5.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

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

#pragma mark - 执行的多个任务
- (NSString *)fetchSomethingFromServer{
    [NSThread sleepForTimeInterval:1];
    return @"Hi there";
}

- (NSString *)processData:(NSString *)data{
    [NSThread sleepForTimeInterval:2];
    return [data uppercaseString];
}

- (NSString *)calculateFirstResult:(NSString *)data{
    [NSThread sleepForTimeInterval:3];
    return [NSString stringWithFormat:@"Number of chars:%d",[data length]];
}

- (NSString *)calculateSecondResult:(NSString *)data{
    [NSThread sleepForTimeInterval:4];
    return [data stringByReplacingOccurrencesOfString:@"E" withString:@"e"];
}

- (IBAction)doWork:(id)sender{
    NSDate *startTime = [NSDate date];
    self.startButton.enabled = NO;
    [self.spinner startAnimating];
    //使用默认队列来执行新的任务
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //将这些耗时的任务都放在默认队列中，这样就不会阻塞主线程
        NSString *fetchedData = [self fetchSomethingFromServer];
        NSString *processedData = [self processData:fetchedData];

        
        __block NSString *firstResult;
        __block NSString *secondResult;
        dispatch_group_t group = dispatch_group_create();
        dispatch_group_async(group, queue, ^{
            firstResult = [self calculateFirstResult:processedData];
        });
        dispatch_group_async(group, queue, ^{
            secondResult = [self calculateSecondResult:processedData];
        });
        dispatch_group_notify(group, queue, ^{
            NSString *resultSummary = [NSString stringWithFormat:@"First:[%@]\nSecond:[%@]",firstResult,secondResult];
            //UI操作需要使用主线程，在上述任务完成后，转回主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                self.resultsTextView.text = resultSummary;
                self.startButton = NO;
                [self.spinner stopAnimating];
            });
            NSDate *endTime = [NSDate date];
            NSLog(@"Completed in %f seconds",[endTime timeIntervalSinceDate:startTime]);
        });
        

    });

}

@end
