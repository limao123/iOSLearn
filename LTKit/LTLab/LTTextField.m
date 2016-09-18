//
//  LTTextFiled.m
//  LTKit
//
//  Created by bmob-LT on 16/9/8.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "LTTextField.h"
#import "Masonry.h"
#import "UIColor+LTAdd.h"
#import "CALayer+LTAdd.h"

@interface UITextField()


@end

@implementation LTTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self = [self initWithStyle:LTTextFieldStyleDefault];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithStyle:LTTextFieldStyleDefault];
}



- (instancetype)initWithStyle:(LTTextFieldStyle)style{
    self = [super initWithFrame:CGRectMake(0, 0, 350, 50)];
    if (self) {
        _viewStyle = style;
        
        //默认外观
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        self.layer.borderWidth = 1;
        self.layer.borderColorFromUIColor = [UIColor colorWithHexString:@"c8c8c8" alpha:1];
        
        self.viewStyle = style;
        
        self.sec = 60;
       
    }
    return self;
}



- (void)setViewStyle:(LTTextFieldStyle)viewStyle {
    
    _viewStyle = viewStyle;
    
    if (viewStyle & LTTextFieldSubViewKeyTextField) {
        _keyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _keyLabel.textColor = [UIColor colorWithHexString:@"333333"];
        _keyLabel.font = [UIFont systemFontOfSize:17];
        [self addSubview:_keyLabel];
    }
    
    if (viewStyle & LTTextFieldSubViewValueTextField) {
        _valueTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _valueTextField.textColor = [UIColor colorWithHexString:@"1e1e1e"];
        _valueTextField.font = [UIFont systemFontOfSize:17];
        [self addSubview:_valueTextField];
    }
    
    if (viewStyle & LTTextFieldSubViewIcon) {
        _icon = [[UIImageView alloc] init];
        _icon.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_icon];
    }
    
    if (viewStyle & LTTextFieldSubViewButton) {
        _button = [[UIButton alloc] init];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    switch (self.viewStyle) {
        case LTTextFieldStyleDefault:{
            [self.valueTextField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.mas_left).offset(15);
                make.right.equalTo(self.mas_right).offset(-15);
            }];
        }
            break;
            
        case LTTextFieldStyleIcon:{
            [self.icon mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.mas_left).offset(15);
                make.width.equalTo(@17);
            }];
            
            [self.valueTextField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.icon.mas_right).offset(6);
                make.right.equalTo(self.mas_right).offset(-15);
            }];
        }
            break;
            
        case LTTextFieldStyleButton:{
            [self.valueTextField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.mas_left).offset(15);
                make.right.equalTo(self.button.mas_left);
            }];
            
            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.width.equalTo(@80);
                make.right.equalTo(self.mas_right).offset(-15);
            }];
        }
            break;
            
        case LTTextFieldStyleIconAndButton:{
            [self.icon mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.mas_left).offset(15);
                make.width.equalTo(@17);
            }];
            
            [self.valueTextField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.icon.mas_right).offset(6);
                make.right.equalTo(self.button.mas_left);
            }];
            
            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.width.equalTo(@80);
                make.right.equalTo(self.mas_right).offset(-15);
            }];
        }
            break;
            
        case LTTextFieldStyleKeyValue:{
            [self.keyLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.mas_left).offset(15);
                make.width.equalTo(@70);
            }];
            
            [self.valueTextField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.keyLabel.mas_right);
                make.right.equalTo(self.mas_right).offset(-15);
            }];
        }
            break;
            
        case LTTextFieldStyleKeyValueAndButton:{
            [self.keyLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.mas_left).offset(15);
                make.width.equalTo(@70);
            }];
            
            [self.valueTextField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.left.equalTo(self.keyLabel.mas_right);
                make.right.equalTo(self.button.mas_right);
            }];
            
            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top);
                make.bottom.equalTo(self.mas_bottom);
                
                make.width.equalTo(@80);
                make.right.equalTo(self.mas_right).offset(-15);
            }];

        }
            break;
            
        default:
            break;
    }
}

#pragma mark - view setting method
- (void)setValuePlacehold:(NSString *)valuePlacehold {
    _valuePlacehold = valuePlacehold;
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:valuePlacehold attributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"b4b4b4"],NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    [self.valueTextField setAttributedPlaceholder:attrStr];
}



- (void)buttonAction {
    if (self.buttonStyle == LTTextFieldButtonStyleSMSCode) {
        [self startTime];
    }
    
    if (self.buttonBlock) {
        self.buttonBlock();
    }
}

- (void)setButtonStr:(NSString *)buttonStr {
    _buttonStr = buttonStr;
    [self.button setTitle:buttonStr forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor colorWithHexString:@"dd9518"] forState:UIControlStateNormal];
    [self.button setFont:[UIFont systemFontOfSize:15]];
    self.button.titleEdgeInsets = UIEdgeInsetsMake(0, self.button.titleLabel.frame.origin.x , 0, 0);
    self.button.titleLabel.textAlignment = NSTextAlignmentRight;
}

- (void)startTime {
    __block int timeout= self.sec; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                [self setButtonStr:self.buttonStr];
                self.button.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
                style.alignment = NSTextAlignmentRight;
                NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ 秒",strTime] attributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"b4b4b4"],NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:style}];
                [self.button setAttributedTitle:attrString forState:UIControlStateNormal];
                self.button.titleEdgeInsets = UIEdgeInsetsMake(0, self.button.titleLabel.frame.origin.x , 0, 0);
                self.button.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}

@end
