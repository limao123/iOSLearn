//
//  ImageTextField.h
//  AddWechatFan
//
//  Created by bmob-LT on 16/7/26.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CountdownBtnBlock)();

typedef NS_ENUM(NSUInteger, ImageTextFieldType) {
    ImageTextFieldTypeNone = 0,
    ImageTextFieldTypeCountdown
};



@interface ImageTextField : UIView
@property (strong,nonatomic) UIImage *image;
@property (strong,nonatomic) NSString *placeholder;
@property (strong,nonatomic,readonly) NSString *text;
@property (unsafe_unretained,nonatomic) ImageTextFieldType type;
@property (unsafe_unretained,nonatomic) BOOL isPassword;
@property (strong,nonatomic) CountdownBtnBlock block;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image placeholder:(NSString *)placeholder Type:(ImageTextFieldType)type;
- (instancetype)initWithImage:(UIImage *)image placeholder:(NSString *)placeholder Type:(ImageTextFieldType)type;
- (void)startTime;
@end
