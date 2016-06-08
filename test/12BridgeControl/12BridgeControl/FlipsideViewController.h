//
//  FlipsideViewController.h
//  12BridgeControl
//
//  Created by 林涛 on 16/2/28.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController
@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UISwitch *engineSwitch;
@property (weak, nonatomic) IBOutlet UISlider *warpFactorSlider;

- (void)refreshFields;
- (IBAction)engineSwitchTapped;
- (IBAction)warpSliderTouched;
- (IBAction)done:(id)sender;
@end
