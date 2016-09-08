//
//  ViewController.m
//  RuntimeDemo
//
//  Created by 林涛 on 16/8/20.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"
#import "ProtocolClient.h"
#import "CategoryClient.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [ProtocolClient use];
//    [CategoryClient use];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
