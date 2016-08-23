//
//  ViewController.m
//  Synthesize
//
//  Created by 林涛 on 16/8/22.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
}

@property (copy,nonatomic) NSString *string;

@end

@implementation ViewController

//@synthesize string;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _string = @"a";
    self.string = @"b";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)

@end
