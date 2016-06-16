//
//  MyVIew.m
//  UIView
//
//  Created by bmob-LT on 16/5/31.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "MyView.h"
#import "Model.h"

@interface MyView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation MyView

- (void)setModel:(Model *)model{
    _model = model;
    self.iconView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;
}

+ (instancetype)appView{
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSArray *views = [mainBundle loadNibNamed:@"MyView" owner:nil options:nil];
    return [views firstObject];
}

+ (instancetype)appViewWithModel:(Model *)model{
    MyView *view = [self appView];
    view.model = model;
    return view;
}


@end
