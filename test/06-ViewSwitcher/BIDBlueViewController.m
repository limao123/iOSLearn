//
//  BIDBlueViewController.m
//  06-ViewSwitcher
//
//  Created by 林涛 on 16/2/24.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "BIDBlueViewController.h"

@interface BIDBlueViewController ()

@end

@implementation BIDBlueViewController

- (IBAction)blueButtonPressed{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Blue View Button Pressed" message:@"You Pressed the button on the blue view" delegate:nil cancelButtonTitle:@"Yep, I did" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
