

//
//  BK8ViewController.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "BK8ViewController.h"
#import "NSObject+Association.h"

@interface BK8ViewController ()

@end

@implementation BK8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test1];
}

- (void)test1 {
    NSObject *obj = [NSObject new];
    NSString *nameForValue = @"Xcode";
    NSString *nameForCode = @"name";
    NSString *nameForBind = @"na";
    nameForBind = [nameForBind stringByAppendingString:@"me"];
    [obj setAssociatedObject:nameForValue forKey:nameForCode];
    NSLog(@"%@",[obj getAssociatedObjectForKey:nameForBind]);
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
