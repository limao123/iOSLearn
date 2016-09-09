
//
//  UIImageViewDemoViewController.m
//  LTKit
//
//  Created by bmob-LT on 16/9/8.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "UIImageViewDemoViewController.h"
#import "UIImage+LTAdd.h"

@interface UIImageViewDemoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;


@end

@implementation UIImageViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [[UIImage imageNamed:@"icon"] imageWithCornerRadius:10 sizeToFit:self.imageView1.bounds.size];
    NSLog(@"%@",image);
    self.imageView1.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
