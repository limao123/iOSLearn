//
//  ViewController.m
//  Dic
//
//  Created by bmob-LT on 16/7/5.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.array = [NSMutableArray arrayWithCapacity:10];
    [self.array addObject:@{@"date":@"",@"user":@""}];
    [self.array addObjectsFromArray:@[@{@"date":@"",@"user":@""},@{@"date":@"",@"user":@""},@{@"date":@"",@"user":@""}]];
    [self modify:1];
    [self enumArray];
}

//添加数据
- (void)add{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"" forKey:@"date"];
    [dic setObject:@"" forKey:@"user"];
    [self.array addObject:dic];
}

//遍历显示数据
- (void)enumArray{
    for (int i = 0; i < self.array.count; i++) {
        NSDictionary *dic = self.array[i];
        NSString *date = dic[@"date"];
        NSString *user = dic[@"user"];
        NSLog(@"%@",dic);
    }
}

//修改数据
- (void)modify:(NSInteger)index{
    NSDictionary *dic = self.array[index];
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [mutableDic setObject:@"test" forKey:@"date"];
    [self.array setObject:[mutableDic copy] atIndexedSubscript:index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
