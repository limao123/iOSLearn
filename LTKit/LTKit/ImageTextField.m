//
//  ImageTextField.m
//  AddWechatFan
//
//  Created by bmob-LT on 16/7/26.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ImageTextField.h"
#import "UIColor+LTAdd.h"


@interface ImageTextField ()
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UITextField *textField;
@property (strong,nonatomic) UIButton *countdownBtn;
@end

@implementation ImageTextField



//指定初始化方法
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image placeholder:(NSString *)placeholder Type:(ImageTextFieldType)type{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _image = image;
        _placeholder = placeholder;
        _type = type;
        
        _imageView = [[UIImageView alloc] init];
        _imageView.image = image;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;;
        [self addSubview:self.imageView];
        
        _textField = [[UITextField alloc] init];
        _textField.placeholder = placeholder;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"cccccc" alpha:0.8],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
        [self addSubview:self.textField];
        
        if (self.type == ImageTextFieldTypeCountdown) {
            _countdownBtn = [[UIButton alloc] init];
            [_countdownBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
            NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"发送验证码" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:12]}];
            [_countdownBtn setAttributedTitle:attrString forState:UIControlStateNormal];
            _countdownBtn.layer.cornerRadius = 12;
            _countdownBtn.backgroundColor = [UIColor colorWithHexString:SYSTEMCOLOR alpha:1];
            [_countdownBtn addTarget:self action:@selector(countdownBtnTarget) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:self.countdownBtn];
        }
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image placeholder:(NSString *)placeholder Type:(ImageTextFieldType)type{
    self = [self initWithFrame:CGRectZero image:image placeholder:placeholder Type:type];
    return self;
}

//- (void)initView {
//    _imageView = [[UIImageView alloc] init];
//    _imageView.image = self.image;
//    [self addSubview:self.imageView];
//    
//    _textField = [[UITextField alloc] init];
//    _textField.placeholder = self.placeholder;
//    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    [self addSubview:self.textField];
//    
//    if (self.type == ImageTextFieldTypeCountdown) {
//        _countdownBtn = [[UIButton alloc] init];
//        [_countdownBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
//        [_countdownBtn addTarget:self action:@selector(countdownBtnTarget) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.countdownBtn];
//    }
//    
//}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

//- (void)setPlaceholder:(NSString *)placeholderText{
//    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"ffffff" alpha:0.8],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
//}
//
//- (void)setType:(ImageTextFieldType)type {
//    _type = type;
//    if (type == ImageTextFieldTypeCountdown) {
//        _countdownBtn = [[UIButton alloc] init];
//        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"发送验证码" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor],NSFontAttributeName:[UIFont systemFontOfSize:12]}];
//        [_countdownBtn setAttributedTitle:attrString forState:UIControlStateNormal];
//        [_countdownBtn addTarget:self action:@selector(countdownBtnTarget) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:self.countdownBtn];
//    }
//    
//}

- (void)setIsPassword:(BOOL)isPassword {
    _isPassword = isPassword;
    self.textField.secureTextEntry = isPassword;
}

- (void)layoutSubviews {
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.width.equalTo(@(self.frame.size.height/2));
        make.height.equalTo(@(self.frame.size.height/2));
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    
    
    if (self.type == ImageTextFieldTypeNone) {
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_top);
            make.bottom.equalTo(self.imageView.mas_bottom).offset(6);
            
            make.left.equalTo(self.imageView.mas_right).offset(10);
            make.right.equalTo(self.mas_right);
        }];
    } else {
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_top);
            make.bottom.equalTo(self.imageView.mas_bottom).offset(6);
            
            make.left.equalTo(self.imageView.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-100);
        }];
        
        
        [self.countdownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.textField.mas_centerY);
            make.height.equalTo(@25);
            
            make.right.equalTo(self.mas_right).offset(-3);
            make.width.equalTo(@73);
        }];
        
    }
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"c6c6c6" alpha:1];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom).offset(-1);
        make.height.equalTo(@1);
        
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
    
    
}

- (void)countdownBtnTarget {
    if (self.block) {
        self.block();
    }
}

- (void)startTime {
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"获取验证码" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:12]}];
                [self.countdownBtn setAttributedTitle:attrString forState:UIControlStateNormal];
                self.countdownBtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@s再发送",strTime] attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:12]}];
                [self.countdownBtn setAttributedTitle:attrString forState:UIControlStateNormal];
                self.countdownBtn.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}

- (NSString *)text {
    return self.textField.text;
}

@end
