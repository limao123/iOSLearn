//
//  FourLines.m
//  13-Persistence
//
//  Created by 林涛 on 16/3/1.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "FourLines.h"

static NSString *const kLinesKey = @"kLinesKey";

@implementation FourLines

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.lines = [aDecoder decodeObjectForKey:kLinesKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.lines forKey:kLinesKey];
}

#pragma mark - Copying

- (id)copyWithZone:(NSZone *)zone{
    FourLines *copy = [[[self class] allocWithZone:zone] init];
    NSMutableArray *linesCopy = [NSMutableArray array];
    for (id line in self.lines) {
        [linesCopy addObject:line];
    }
    copy.lines = linesCopy;
    return copy;
}


@end
