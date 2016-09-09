//
//  LoginViewModel.m
//  LTKit
//
//  Created by bmob-LT on 16/9/1.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "LoginViewModel.h"

@interface LoginViewModel ()


@end

@implementation LoginViewModel
- (IBAction)loginAction:(id)sender{
    self.ownerViewController.navigationItem.titleView = self.spinner;
    [self.spinner startAnimating];

}
@end
