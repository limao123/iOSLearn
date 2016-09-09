//
//  LTTextFiled.h
//  LTKit
//
//  Created by bmob-LT on 16/9/8.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, LTTextFieldSubView) {
    LTTextFieldSubViewNone = 0,
    LTTextFieldSubViewIcon = 1 << 0,
    LTTextFieldSubViewKeyTextField = 1 << 1,
    LTTextFieldSubViewValueTextField = 1 << 2,
    LTTextFieldSubViewButton = 1 << 3
};

typedef NS_ENUM(NSUInteger,LTTextFieldStyle){
    LTTextFieldStyleDefault = LTTextFieldSubViewValueTextField,
    
    LTTextFieldStyleIcon = LTTextFieldSubViewValueTextField |
    LTTextFieldSubViewIcon,
    
    
    LTTextFieldStyleButton = LTTextFieldSubViewValueTextField |
    LTTextFieldSubViewButton,
    
    LTTextFieldStyleIconAndButton = LTTextFieldSubViewValueTextField |
    LTTextFieldSubViewIcon |
    LTTextFieldSubViewButton,
    
    LTTextFieldStyleKeyValue = LTTextFieldSubViewKeyTextField |
    LTTextFieldSubViewValueTextField,
    
    LTTextFieldStyleKeyValueAndButton = LTTextFieldSubViewKeyTextField |
    LTTextFieldSubViewValueTextField |
    LTTextFieldStyleButton
    
};

typedef  NS_ENUM(NSUInteger,LTTextFieldButtonStyle){
    LTTextFieldButtonStyleJump,
    LTTextFieldButtonStyleSMSCode
};

typedef void(^ButtonAction)();

@interface LTTextFiled : UIView
@property (strong,nonatomic) UILabel *keyLabel;


@property (strong,nonatomic) UITextField *valueTextField;
@property (copy,nonatomic) NSString *valuePlacehold;


@property (strong,nonatomic) UIImageView *icon;

@property (strong,nonatomic) UIButton *button;
@property (unsafe_unretained,nonatomic) LTTextFieldButtonStyle buttonStyle;
@property (copy,nonatomic) NSString *buttonStr;
@property (copy,nonatomic) ButtonAction buttonBlock;


@property (unsafe_unretained,nonatomic)  LTTextFieldStyle viewStyle;

- (instancetype)initWithStyle:(LTTextFieldStyle)style;
@end
