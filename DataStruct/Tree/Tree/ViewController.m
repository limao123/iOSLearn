//
//  ViewController.m
//  Tree
//
//  Created by 林涛 on 16/6/23.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
//    if (Fie) {
//        
//    }
}

- (void)listDirWithDirPath:(NSString *)dirPath andDepth:(int)depth{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDic;
    BOOL isFile = [fileManager fileExistsAtPath:dirPath isDirectory:&isDic];
    if (isFile) {
        NSArray *subFiles = [fileManager subpathsAtPath:dirPath];
        if (isDic) {
            for (NSString *file in <#collection#>) {
                <#statements#>
            }
        }

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
