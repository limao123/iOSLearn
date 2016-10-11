


//
//  BK2ViewController.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/11.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "BK2ViewController.h"
#import "Base2Model.h"

@interface BK2ViewController ()

@end

@implementation BK2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDate *date2 = [NSDate date];
    
    
    Base2Model *model = [[Base2Model alloc] init];
    [model.date1 release];
    
    //此方法无法释放date2，为什么？
//    [model.date2 release];
    
    model.date2 = date2;
    [date2 release];
    
    [model.date2 dateByAddingTimeInterval:1];
    [model.date1 dateByAddingTimeInterval:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
