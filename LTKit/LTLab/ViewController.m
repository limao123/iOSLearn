//
//  ViewController.m
//  LTLab
//
//  Created by bmob-LT on 16/9/1.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UISegmentedControl *mySC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 去掉颜色,现在整个segment偶看不到,可以相应点击事件
//    self.mySC.tintColor = [UIColor clearColor];
//    
//    // 正常状态下
//    NSDictionary * normalTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0f],NSForegroundColorAttributeName : [UIColor grayColor]};
//    [self.mySC setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
//    
//    // 选中状态下
//    NSDictionary * selctedTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0f],NSForegroundColorAttributeName : [UIColor redColor]};
//    [self.mySC setTitleTextAttributes:selctedTextAttributes forState:UIControlStateSelected];
    __weak typeof(self) weakSelf = self;
//    id weak weakSelf = self;
//    id __block weakSelf = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
