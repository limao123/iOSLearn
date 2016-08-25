//
//  ViewController.m
//  JSInteractionDemo
//
//  Created by bmob-LT on 16/8/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

#import "MyJSObject.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *localLabel;
@property (strong,nonatomic) JSContext *context;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCreateJSContext:) name:@"DidCreateContextNotification" object:nil];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    NSString *path = @"www.baidu.com";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    [self.webView loadRequest:request];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMsgAction:(id)sender {

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

    
//    [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    MyJSObject *jsObject = [MyJSObject new];
    context[@"ttf"] = jsObject;    //将对象注入这个context中
//
//    context[@"passValue"] = ^{
//        
//        NSArray *arg = [JSContext currentArguments];
//        for (id obj in arg) {
//            NSLog(@"%@", obj);
//        }
//    };
    
}

- (void)didCreateJSContext:(NSNotification *)notification {
    NSString *indentifier = [NSString stringWithFormat:@"indentifier%lud", (unsigned long)self.webView.hash];
    NSString *indentifierJS = [NSString stringWithFormat:@"var %@ = '%@'", indentifier, indentifier];
    [self.webView stringByEvaluatingJavaScriptFromString:indentifierJS];
    
    JSContext *context = notification.object;
    //判断这个context是否属于当前这个webView
    if (![context[indentifier].toString isEqualToString:indentifier]) return;
    
    _context = context;        //如果属于这个webView
    MyJSObject *jsObject = [MyJSObject new];
    _context[@"ttf"] = jsObject;    //将对象注入这个context中
}

@end
