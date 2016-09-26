//
//  ExamNonARCViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/6.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ExamNonARCViewController.h"

@interface ExamNonARCViewController ()

@end

@implementation ExamNonARCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self exam54];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)exam54 {
    NSMutableArray *a = [[NSMutableArray alloc] initWithCapacity:1];
    [a release];
    [a addObject:@1];
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
