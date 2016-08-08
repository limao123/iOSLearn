//
//  ViewController.m
//  iOSInterviewQuestions
//
//  Created by 林涛 on 16/8/8.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"
#import "Father.h"
#import "Mother.h"
#import "Child.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self fatherAndChild];
    [self motherAndChild];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fatherAndChild {
    Father *jone = [[Father alloc] initWithName:@"Jone"];
    Child *lily = [[Child alloc] initWithName:@"Lily"];
    lily.father = jone;
    Child *mike = [[Child alloc] initWithName:@"Mike"];
    mike.father = jone;
    jone.childs = @[lily,mike];
}

- (void)motherAndChild {
    Mother *lucy = [[Mother alloc] initWithName:@"Lucy"];
    Child *lily = [[Child alloc] initWithName:@"Lily"];
    lily.mother = lucy;
    Child *mike = [[Child alloc] initWithName:@"Mike"];
    mike.mother = lucy;
    lucy.childs = @[lily,mike];
}

@end
