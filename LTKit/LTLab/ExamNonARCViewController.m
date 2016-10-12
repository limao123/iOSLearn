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
    
//    [self exam54];
    [self exam65];
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

- (void)exam65 {
    NSMutableArray* ary = [[NSMutableArray array] retain];
    NSString *str = [NSString stringWithFormat:@"test"];
    [str retain];
    [ary addObject:str];
    NSLog(@"%@%d",str,[str retainCount]);
    [str retain];
    [str release];
    [str release];
    NSLog(@"%@%d",str,[str retainCount]);
    [ary removeAllObjects];
    NSLog(@"%@%d",str,[str retainCount]);
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
