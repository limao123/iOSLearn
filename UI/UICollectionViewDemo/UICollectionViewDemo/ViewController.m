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
@property (strong,nonatomic) UIImage *selectImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.selectImage = [UIImage imageNamed:@"9"];
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
    cell.imageView.highlightedImage = self.selectImage;
    cell.titleLabel.text = title;
    return cell;
}


/*
 -￼collectionView:shouldHighlightItemAtIndexPath: 是否应该高亮？
 -￼collectionView:didHighlightItemAtIndexPath: 如果1回答为是，那么高亮
 -￼collectionView:shouldSelectItemAtIndexPath: 无论1结果如何，都询问是否可以被选中？
 -collectionView:didUnhighlightItemAtIndexPath: 如果1回答为是，那么现在取消高亮
 -collectionView:didSelectItemAtIndexPath: 如果3回答为是，那么选中cell
 */

//控制能否高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//控制高亮后的动作
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

//控制能否被选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//控制取消高亮后的动作
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

//控制选中后的动作
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
