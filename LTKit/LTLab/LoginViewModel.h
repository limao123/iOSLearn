//
//  LoginViewModel.h
//  LTKit
//
//  Created by bmob-LT on 16/9/1.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewModel : NSObject
@property (nonatomic, weak) IBOutlet UIViewController *ownerViewController;
@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)loginAction:(id)sender;
@end
