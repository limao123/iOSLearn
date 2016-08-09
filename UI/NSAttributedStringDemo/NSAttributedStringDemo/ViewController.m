//
//  ViewController.m
//  NSAttributedStringDemo
//
//  Created by bmob-LT on 16/8/9.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self mutableAttrStrUse];
    [self paragraphStyleUse];
}

- (void)sampleUse {
    //初始化
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont systemFontOfSize:11]}];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    label.attributedText = attrStr;
    [self.view addSubview:label];
}

- (void)mutableAttrStrUse {
    NSString *str1 = @"test1";
    NSString *str2 = @"test2";
    NSString *str = [NSString stringWithFormat:@"%@\n%@",str1,str2];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    //设置第一行字符的颜色为灰色，大小为14
    [attrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range: [str rangeOfString:str]];
    //设置第二行字符的颜色为绿色，大小为12
    [attrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont systemFontOfSize:12]} range: [str rangeOfString:str2]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    
    label.attributedText = attrStr;
    //多行设置为0
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

- (void)paragraphStyleUse {
    NSString *str1 = @"test1";
    NSString *str2 = @"test2";
    NSString *str = [NSString stringWithFormat:@"%@\n%@",str1,str2];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    //文字居中
    style.alignment = NSTextAlignmentCenter;
    //行间距为30
    style.lineSpacing = 30;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSParagraphStyleAttributeName:style}];
    
    //设置第一行字符的颜色为红色，大小为14
    [attrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range: [str rangeOfString:str]];
    //设置第二行字符的颜色为绿色，大小为12
    [attrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont systemFontOfSize:12]} range: [str rangeOfString:str2]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    label.attributedText = attrStr;
    //多行设置为0
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
