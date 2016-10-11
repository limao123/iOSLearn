
//
//  MainViewController.m
//  LTKit
//
//  Created by bmob-LT on 2016/10/11.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "MainViewController.h"
#import "BaseKnowledgeViewController.h"
#import "Masonry.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,readwrite,strong) UITableView *tableView;
@property (nonatomic,readwrite,copy) NSArray *dataArray;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_bottom);
        
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    self.dataArray = @[@"基础题"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /**
     *  
        const就是只读的意思;
        static一般有2个作用,规定作用域和存储方式.
        对于局部变量,static规定其为静态存储方式,每次调用的初始值为上一次调用的值,调用结束后存储空间不释放;
        对于全局变量,如果以文件划分作用域的话,此变量只在当前文件可见;对于static函数也是在当前模块内函数可见.
     */
    static NSString * identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            BaseKnowledgeViewController *baseKnowledgeVC = [[BaseKnowledgeViewController alloc] init];
            [self.navigationController pushViewController:baseKnowledgeVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}


@end
