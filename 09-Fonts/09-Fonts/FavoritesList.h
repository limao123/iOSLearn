//
//  FavoritesList.h
//  09-Fonts
//
//  Created by 林涛 on 16/2/28.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject
+ (instancetype)sharedFavoritesList;
- (NSArray *)favorites;
- (void)addFavorite:(id)item;
- (void)removeFavorite:(id)item;
@end
