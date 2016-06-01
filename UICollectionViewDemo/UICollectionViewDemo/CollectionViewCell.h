//
//  CollectionViewCell.h
//  UICollectionViewDemo
//
//  Created by 林涛 on 16/6/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
