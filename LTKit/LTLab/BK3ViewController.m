

//
//  BK3ViewController.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/11.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "BK3ViewController.h"
#import "BK3Model.h"
#import "BK3MRCModel.h"

@interface BK3ViewController ()
@property (nonatomic,readwrite,strong) BK3MRCModel *bk3MRCModel;
@end

@implementation BK3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self exam1];
    [self exam2];
    [self exam3];
    

}

- (void)exam1 {
    BK3Model *bk3Model = [[BK3Model alloc] init];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@1,@2]];
    
    bk3Model.arrayOfStrong = mutableArray;
    bk3Model.arrayOfCopy = mutableArray;
    NSLog(@"arrayOfStrong:%@",bk3Model.arrayOfStrong);
    NSLog(@"arrayOfCopy:%@",bk3Model.arrayOfCopy);
    
    [mutableArray addObject:@3];
    NSLog(@"修改可变数组后");
    NSLog(@"arrayOfStrong:%@",bk3Model.arrayOfStrong);
    NSLog(@"arrayOfCopy:%@",bk3Model.arrayOfCopy);
}

- (void)exam2 {
    self.bk3MRCModel = [[BK3MRCModel alloc] init];
    
    //为什么直接到这里就崩了，意思是栈区不能给block赋值吗，猜测可能是在赋值时就做了地址检查，给block赋了一个栈区的地址，就会直接导致程序崩溃
    MyBlock block = [self func];
    self.bk3MRCModel.block = block;
    
//    int i = 123;
//    MyBlock block = ^{
//        return i;
//    };
//    
//    //在MAR 情况下，此处也使用了strong，打印地址发现没有改变，但打印类型，发现已经变了,猜测编译器在MRC的情况下也给做了copy操作,所以其实现在是MRC还是ARC，block都可以使用strong
//    self.bk3MRCModel.block = [block copy];
    
}

- (void)exam3 {
    int i = self.bk3MRCModel.block();
    NSLog(@"%@",@(i));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//typedef int(^MyBlock)();
//MyBlock func()
//{
//    int i = 123;
//
//    return  ^{ return i; };
//
//}


- (MyBlock)func {
    int i = 123;
    //非ARC下不要这样！！！
    MyBlock ret = ^{ return i; };
    return ret;
}

@end
