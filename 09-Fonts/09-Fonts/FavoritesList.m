//
//  FavoritesList.m
//  09-Fonts
//
//  Created by 林涛 on 16/2/28.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "FavoritesList.h"

@interface FavoritesList ()
@property (strong, nonatomic) NSMutableArray *favorites;

@end

@implementation FavoritesList

+ (instancetype)sharedFavoritesList{
    static FavoritesList *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *storedFavorite = [defaults objectForKey:@"favorites"];
        if (storedFavorite) {
            self.favorites = [storedFavorite mutableCopy];
        } else {
            self.favorites = [NSMutableArray array];
        }
    }
    return self;
}

- (void)addFavorite:(id)item{
    [_favorites insertObject:item atIndex:0];
    [self saveFavorite];
}

- (void)removeFavorite:(id)item{
    [_favorites removeObject:item];
    [self saveFavorite];
}

- (void)saveFavorite{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favorites forKey:@"favorites"];
    [defaults synchronize];
}

@end
