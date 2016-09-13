//
//  ViewController.m
//  IAPDemo
//
//  Created by bmob-LT on 16/9/13.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>
#import "IAPShare.h"

@interface ViewController ()<SKPaymentTransactionObserver,SKProductsRequestDelegate>
@property (copy,nonatomic) NSString *productID;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
//    self.productID = @"cn.bmob.fans.1";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)IAPHelperBuy:(id)sender {
    //添加支付观察
    if(![IAPShare sharedHelper].iap) {
        NSSet* dataSet = [[NSSet alloc] initWithObjects:@"cn.bmob.fans.1", nil];
        
        [IAPShare sharedHelper].iap = [[IAPHelper alloc] initWithProductIdentifiers:dataSet];
    }
    
    //设置是生产环境还是调试环境
    [IAPShare sharedHelper].iap.production = NO;
    
    //请求商品信息
    [[IAPShare sharedHelper].iap requestProductsWithCompletion:^(SKProductsRequest* request,SKProductsResponse* response)
     {
         if(response > 0 ) {
             SKProduct* product =[[IAPShare sharedHelper].iap.products objectAtIndex:0];
             
             //发起购买请求
             [[IAPShare sharedHelper].iap buyProduct:product
                                        onCompletion:^(SKPaymentTransaction* trans){
                                            
                                            if(trans.error){
                                                NSLog(@"Fail %@",[trans.error localizedDescription]);
                                            } else if(trans.transactionState == SKPaymentTransactionStatePurchased) {
                                                // 到这里购买就成功了，但是因为存在越狱手机下载某些破解内购软件的情况，需要跟苹果服务器的确认是否购买成功，IAPHelper提供了这个方法，验证这步可以写在前端，也可以写在服务器端
                                                
                                                
//                                                [[IAPShare sharedHelper].iap checkReceipt:trans.transactionReceipt AndSharedSecret:@"your sharesecret" onCompletion:^(NSString *response, NSError *error) {
//                                                    
//                                                    //Convert JSON String to NSDictionary
//                                                    NSDictionary* rec = [IAPShare toJSON:response];
//                                                    
//                                                    if([rec[@"status"] integerValue]==0)  {
//                                                        
//                                                        [[IAPShare sharedHelper].iap provideContentWithTransaction:trans];
//                                                        NSLog(@"SUCCESS %@",response);
//                                                        NSLog(@"Pruchases %@",[IAPShare sharedHelper].iap.purchasedProducts);
//                                                    }
//                                                    else {
//                                                        NSLog(@"Fail");
//                                                    }
//                                                }];
                                            }
                                            else if(trans.transactionState == SKPaymentTransactionStateFailed) {
                                                NSLog(@"Fail");
                                            }
                                        }];//end of buy product
         }
     }];
}

- (IBAction)buy:(id)sender {
    
    
    
    NSString *product = self.productID;
    //检测是否支持IAP
    if([SKPaymentQueue canMakePayments]){
        [self requestProductData:product];
    }else{
        NSLog(@"不允许程序内付费");
    }
}



//请求商品
- (void)requestProductData:(NSString *)type{
    NSLog(@"-------------请求对应的产品信息----------------");
    NSArray *product = [[NSArray alloc] initWithObjects:type,nil];
    
    NSSet *nsset = [NSSet setWithArray:product];
    
    //请求商品信息
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:nsset];
    request.delegate = self;
    [request start];
    
}

//收到产品返回信息
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    NSLog(@"--------------收到产品反馈消息---------------------");
    NSArray *product = response.products;
    if([product count] == 0){
        NSLog(@"--------------没有商品------------------");
        return;
    }
    
    NSLog(@"productID:%@", response.invalidProductIdentifiers);
    NSLog(@"产品付费数量:%d",[product count]);
    
    SKProduct *p = nil;
    for (SKProduct *pro in product) {
        NSLog(@"%@", [pro description]);
        NSLog(@"%@", [pro localizedTitle]);
        NSLog(@"%@", [pro localizedDescription]);
        NSLog(@"%@", [pro price]);
        NSLog(@"%@", [pro productIdentifier]);
        
        if([pro.productIdentifier isEqualToString:self.productID]){
            p = pro;
        }
    }
    
    SKPayment *payment = [SKPayment paymentWithProduct:p];
    
    NSLog(@"发送购买请求");
    //发送购买请求
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

//请求失败
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"------------------错误-----------------:%@", error);
}

- (void)requestDidFinish:(SKRequest *)request{
    NSLog(@"------------反馈信息结束-----------------");
}


//监听购买结果
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transaction{
    for(SKPaymentTransaction *tran in transaction){
        
        switch (tran.transactionState) {
            case SKPaymentTransactionStatePurchased:{
                [self completeTransaction:tran];
                NSLog(@"交易完成");
            }
                break;
                
                
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"商品添加进列表");
                
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"已经购买过商品");
                
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"交易失败");
                
                break;
            default:
                break;
        }
    }
}

//交易结束
- (void)completeTransaction:(SKPaymentTransaction *)transaction{
    NSLog(@"交易结束");
    //交易验证
    NSURL *recepitURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receipt = [NSData dataWithContentsOfURL:recepitURL];
    
    if(!receipt){
        
    }
    
    NSError *error;
    NSDictionary *requestContents = @{
                                      @"receipt-data": [receipt base64EncodedStringWithOptions:0]
                                      };
    NSData *requestData = [NSJSONSerialization dataWithJSONObject:requestContents
                                                          options:0
                                                            error:&error];
    
    if (!requestData) { /* ... Handle error ... */ }
    
    //In the test environment, use https://sandbox.itunes.apple.com/verifyReceipt
    //In the real environment, use https://buy.itunes.apple.com/verifyReceipt
    // Create a POST request with the receipt data.
    NSURL *storeURL = [NSURL URLWithString:@"https://sandbox.itunes.apple.com/verifyReceipt"];
    NSMutableURLRequest *storeRequest = [NSMutableURLRequest requestWithURL:storeURL];
    [storeRequest setHTTPMethod:@"POST"];
    [storeRequest setHTTPBody:requestData];
    
    // Make a connection to the iTunes Store on a background queue.
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:storeRequest queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
                                   /* ... Handle error ... */
                               } else {
                                   NSError *error;
                                   NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                                   if (!jsonResponse) { /* ... Handle error ...*/ }
                                   /* ... Send a response back to the device ... */
                                   //Parse the Response
                               }
                           }];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

@end
