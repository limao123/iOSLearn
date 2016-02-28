//
//  FontListTableViewController.h
//  09-Fonts
//
//  Created by 林涛 on 16/2/28.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontListTableViewController : UITableViewController
@property (copy, nonatomic) NSArray *fontNames;
@property (assign, nonatomic) BOOL showsFavorites;
@end
