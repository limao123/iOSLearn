//
//  MainViewController.m
//  13-CoreDataPersistence
//
//  Created by 林涛 on 16/3/3.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

static NSString * const kLineEntityName = @"Line";
static NSString * const kLineNumberKey = @"lineNumber";
static NSString * const kLineTextKey = @"lineText";

@interface MainViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lineFields;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:kLineEntityName];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects == nil) {
        NSLog(@"There was an error!");
    }
    
    for (NSManagedObject *oneObject in objects) {
        int lineNum = [[oneObject valueForKey:kLineNumberKey] intValue];
        NSString *lineText = [oneObject valueForKey:kLineTextKey];
        UITextField *theField = self.lineFields[lineNum];
        theField.text = lineText;
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

- (void)applicationWillResignActive:(NSNotification *)notification{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *constext = [appDelegate managedObjectContext];
    NSError *error;
    for (int i = 0; i < 4; i++) {
        UITextField *theField = self.lineFields[i];
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:kLineEntityName];
        //判断是否已经存在该lineNumber的对象
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(%K = %d)",kLineNumberKey,i];
        [request setPredicate:pred];
        
        NSArray *objects = [constext executeFetchRequest:request error:&error];
        if (objects == nil) {
            NSLog(@"There was an error!");
        }
        
        NSManagedObjectContext *theLine = nil;
        //判断是否已经有该对象，如果没有则新建，如果有则加载原来的
        if ([objects count] > 0) {
            theLine = [objects objectAtIndex:0];
        } else {
            theLine = [NSEntityDescription insertNewObjectForEntityForName:kLineEntityName inManagedObjectContext:constext];
        }
        [theLine setValue:[NSNumber numberWithInt:i] forKey:kLineNumberKey];
        [theLine setValue:theField.text forKey:kLineTextKey];
    }
    [appDelegate saveContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
