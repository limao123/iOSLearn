//
//  ViewController.m
//  JSInteractionDemo
//
//  Created by bmob-LT on 16/8/25.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "WebViewJavascriptBridge.h"
#import "MyJSObject.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) WebViewJavascriptBridge *bridge;
@property (weak, nonatomic) IBOutlet UILabel *nativeLabel;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    if (_bridge) {
        return;
    }
    [WebViewJavascriptBridge enableLogging];
    
    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    [_bridge setWebViewDelegate:self];
    
    //注册一个给JS调用的方法
    [self.bridge registerHandler:@"ObjC Echo" handler:^(id data, WVJBResponseCallback responseCallback) {
        //显示来自JS的消息
        self.nativeLabel.text = [NSString stringWithFormat:@"来自JS的消息:%@",data];
        //发送一个回复给JS
        responseCallback(@"好的JS，我已经收到了");
    }];
    

    

    
    [self loadExamplePage:self.webView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化WebViewJavascriptBridge


    
}

- (IBAction)callJS:(id)sender {
    //调用JS的一个方法
//    [self.bridge callHandler:@"JS Echo" data:@"JS 我发了一个消息给你" responseCallback:^(id responseData) {
//        //显示JS的回复
//        self.nativeLabel.text =  [NSString stringWithFormat:@"来自JS的回复:%@",responseData];
//    }];
    
//    [self.bridge callHandler:@"JS Echo" data:@{@"key":@"value"} responseCallback:^(id responseData) {
//        //显示JS的回复
//        self.nativeLabel.text =  [NSString stringWithFormat:@"来自JS的回复:%@",responseData];
//    }];
    
    [self.bridge callHandler:@"JS Echo" data:@[@"a1",@"a2"] responseCallback:^(id responseData) {
        //显示JS的回复
        self.nativeLabel.text =  [NSString stringWithFormat:@"来自JS的回复:%@",responseData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadExamplePage:(UIWebView*)webView {
    NSString* htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
    NSString* appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    [webView loadHTMLString:appHtml baseURL:baseURL];
}


@end
