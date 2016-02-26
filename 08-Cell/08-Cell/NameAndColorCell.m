//
//  NameAndColorCell.m
//  08-Cell
//
//  Created by 林涛 on 16/2/26.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell()
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *colorLabel;

@end

@implementation NameAndColorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameMarker = [[UILabel alloc] initWithFrame:nameLabelRect];
        nameMarker.textAlignment = NSTextAlignmentRight;
        nameMarker.text = @"name";
        nameMarker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:nameMarker];
        
        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *coloerMaker = [[UILabel alloc] initWithFrame:colorLabelRect];
        coloerMaker.textAlignment = NSTextAlignmentRight;
        coloerMaker.text = @"Color:";
        coloerMaker.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:coloerMaker];
        
        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
        _nameLabel = [[UILabel alloc] initWithFrame:nameValueRect];
        [self.contentView addSubview:_nameLabel];
        
        CGRect colorValueRect = CGRectMake(80, 25, 200, 15);
        _colorLabel = [[UILabel alloc] initWithFrame:colorValueRect];
        [self.contentView addSubview:_colorLabel];
    }
    return self;
}

- (void)setName:(NSString *)name{
    if (![name isEqualToString:_name]) {
        _name = [name copy];
        self.nameLabel.text = _name;
    }
}

- (void)setColor:(NSString *)color{
    if (![color isEqualToString:_color]) {
        _color = [color copy];
        self.colorLabel.text = _color;
    }
}
@end
