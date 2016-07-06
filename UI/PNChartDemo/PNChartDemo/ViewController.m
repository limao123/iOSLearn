//
//  ViewController.m
//  PNChartDemo
//
//  Created by bmob-LT on 16/7/5.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import "PNChart.h"
@interface ViewController ()
@property (strong,nonatomic) PNLineChart *lineChart;
@end

@implementation ViewController

- (IBAction)data1:(id)sender {

    
    // Line Chart No.1
    [self.lineChart setYLabels:@[@"20", @"40", @"60", @"80",@"100"] ];

    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = self.lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    data01.dataTitle = @"1";
    self.lineChart.chartData = @[data01];
    [self.lineChart strokeChart];
    
    
}

- (IBAction)data2:(id)sender {
    // Line Chart No.2
    NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = self.lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    data02.dataTitle = @"222";
    self.lineChart.chartData = @[data02];
    [self.lineChart strokeChart];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 400.0)];
    [self.lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    [self.view addSubview:self.lineChart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
