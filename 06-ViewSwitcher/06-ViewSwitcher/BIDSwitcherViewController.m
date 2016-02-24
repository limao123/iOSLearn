//
//  BIDSwitcherViewController.m
//  06-ViewSwitcher
//
//  Created by 林涛 on 16/2/24.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "BIDSwitcherViewController.h"
#import "BIDBlueViewController.h"
#import "BIDYellowViewController.h"

@interface BIDSwitcherViewController ()
@property (strong, nonatomic) BIDBlueViewController *blueViewController;
@property (strong, nonatomic) BIDYellowViewController *yellowViewController;
@end

@implementation BIDSwitcherViewController

- (IBAction)switchView:(id)sender{
    //如果该视图没有父视图，则释放它
    //当前显示是蓝
    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (!self.yellowViewController.view.superview) {
        if (!self.yellowViewController) {
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
        }
        
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    } else {
        //当前显示是黄
        if (!self.blueViewController) {
            self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
        }
        
        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    }
    [UIView commitAnimations];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    [self.view insertSubview:self.blueViewController.view atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (!self.blueViewController.view.superview) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
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
