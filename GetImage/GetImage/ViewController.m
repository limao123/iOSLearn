//
//  ViewController.m
//  GetImage
//
//  Created by 林涛 on 16/7/19.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)getURL{
    NSString *urlStr = [NSString stringWithFormat:@"http://image.baidu.com/search/acjson?tn=resultjson_com&ipn=rj&ct=201326592&fp=result&queryWord=美女&lm=-1&ie=utf-8&oe=utf-8&st=-1&ic=0&word=美女&face=0&istype=2nc=1&pn=0&rn=6"];
    NSString *newStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:newStr];
    NSURLRequest *requst = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    //异步链接(形式1,较少用)
    [NSURLConnection sendAsynchronousRequest:requst queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 解析
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@", dic);
        
        NSArray *urls = [self buildURLWithDic:dic];
        NSLog(@"%@",urls);
        
    }];
}

- (NSArray *)buildURLWithDic:(NSDictionary *)dic{
    NSArray *datas = dic[@"data"];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *objURL = obj[@"objURL"];
        if (objURL) {
            NSString *realURL = [self convertBaiduURL:objURL];
            [array addObject:realURL];
        }
    }];
    return [array copy];
}

- (NSString *)convertBaiduURL:(NSString *)objURL{
    NSDictionary *dic1 = @{    @"_z2C$q": @":",
                               @"_z&e3B": @".",
                               @"AzdH3F": @"/",
                               @"w": @"a",
                               @"k": @"b",
                               @"v": @"c",
                               @"1": @"d",
                               @"j": @"e",
                               @"u": @"f",
                               @"2": @"g",
                               @"i": @"h",
                               @"t": @"i",
                               @"3": @"j",
                               @"h": @"k",
                               @"s": @"l",
                               @"4": @"m",
                               @"g": @"n",
                               @"5": @"o",
                               @"r": @"p",
                               @"q": @"q",
                               @"6": @"r",
                               @"f": @"s",
                               @"p": @"t",
                               @"7": @"u",
                               @"e": @"v",
                               @"o": @"w",
                               @"8": @"1",
                               @"d": @"2",
                               @"n": @"3",
                               @"9": @"4",
                               @"c": @"5",
                               @"m": @"6",
                               @"0": @"7",
                               @"b": @"8",
                               @"l": @"9",
                               @"a": @"0"};

    NSMutableString *realURL = [NSMutableString stringWithCapacity:1];
    for (int i = 0; i < objURL.length; i++) {
        NSString *key = [objURL substringWithRange:NSMakeRange(i, 1)];
        if ([key isEqualToString:@"_"] || [key isEqualToString:@"A"]) {
            key = [objURL substringWithRange:NSMakeRange(i, 6)];
            if ([key isEqualToString:@"_z2C$q"] ||
                [key isEqualToString:@"_z&e3B"] ||
                [key isEqualToString:@"AzdH3F"]) {
                i+=5;
            } else {
                key = [objURL substringWithRange:NSMakeRange(i, 1)];
            }
            
        }
        NSString *value = dic1[key];
        if (value) {
            [realURL appendString:value];
        } else {
            [realURL appendString:key];
        }
        
    }
    return [realURL copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
