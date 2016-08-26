//
//  ViewController.m
//  UINavigationVCDemo
//
//  Created by bmob-LT on 16/6/7.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)jump:(id)sender {
//    MyViewController *myVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyVC"];
//    [self.navigationController pushViewController:myVC animated:YES];
    //MyViewController *myVC2 = [ ]
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self setNavigationColor];
    [self setButton];
    [self setTitleView];
    [self setPrompt];
    [self setToolBar];
}

- (void)setNavigationTitle{
    self.title = @"navigationcontroller";
}

- (void)setNavigationColor{
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];//设置navigationbar的颜色
}

- (void)setButton{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:Nil];//设置navigationbar左边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:Nil];//设置navigationbar右边按钮
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];//设置navigationbar上左右按钮字体颜色
}

- (void)setTitleView{
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:arr];
    self.navigationItem.titleView = segment;//设置navigation上的titleview
}

- (void)setPrompt{
    self.navigationItem.prompt = @"Hello, im the prompt";
}

- (void)setToolBar{
    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil]];
    self.navigationController.toolbarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [segue.identifier isEqualToString:@"MyVCJump"];
    
    
}

@end
