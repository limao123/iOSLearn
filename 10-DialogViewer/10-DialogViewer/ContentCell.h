//
//  ContentCell.h
//  10-DialogViewer
//
//  Created by 林涛 on 16/2/28.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentCell : UICollectionViewCell
@property (strong, nonatomic) UILabel *label;
@property (copy, nonatomic) NSString *text;
+ (CGSize)sizeForContentString:(NSString *)s;
@end
