//
//  ViewController.h
//  UICollectionViewDemo
//
//  Created by 林涛 on 16/6/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong, nonatomic) NSMutableArray *dataMArr;

@end

