//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by 林涛 on 16/6/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataMArr = [NSMutableArray array];
    for (int i = 0;i < 9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)i+1]];
        NSString *title = [NSString stringWithFormat:@"{0,%ld}",(long)i+1];
        [self.dataMArr addObject:@{@"image":image,@"title":title}];
    }
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataMArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *collectionCellID = @"myCollectionCell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    NSDictionary *dic = self.dataMArr[indexPath.row];
    UIImage *image = dic[@"image"];
    NSString *title = dic[@"title"];
    cell.imageView.image = image;
    cell.titleLabel.text = title;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
