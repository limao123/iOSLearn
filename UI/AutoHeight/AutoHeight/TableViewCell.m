//
//  TableViewCell.m
//  AutoHeight
//
//  Created by bmob-LT on 16/8/10.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "TableViewCell.h"

@interface  TableViewCell ()
@property (strong,nonatomic) UILabel *label;

@end


@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
}

- (void)setEntity:(NSString *)entity {
    _entity = entity;
    self.label.text = entity;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
