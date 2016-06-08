//
//  ViewController.h
//  12BridgeControl
//
//  Created by 林涛 on 16/2/28.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipsideViewController.h"

#define kOfficerKey                    @"officer"
#define kAuthorizationCodeKey          @"authorizationCode"
#define kRankKey                       @"rank"
#define kWarpDriveKey                  @"warp"
#define kWarpFactorKey                 @"warpFactor"
#define kFavoriteTeaKey                @"favoriteTea"
#define kFavoriteCaptainKey            @"favoriteCaptain"
#define kFavoriteGadgetKey             @"favoriteGadget"
#define kFavoriteAlienKey              @"favoriteAlien"

@interface ViewController : UIViewController<FlipsideViewControllerDelegate>
@end

