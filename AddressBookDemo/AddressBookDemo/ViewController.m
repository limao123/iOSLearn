//
//  ViewController.m
//  AddressBookDemo
//
//  Created by bmob-LT on 16/7/22.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self addressBookRead];
//    [self addresBookWrite];
    [self addressBookDelete];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addressBookRead {
    CNContactStore * store = [[CNContactStore alloc]init];
    //检索条件，检索所有名字中有zhang的联系人
    NSPredicate * predicate = [CNContact predicateForContactsMatchingName:@"jaki"];
//    NSPredicate * predicate = [CNContact predicateForContactsWithIdentifiers:@[@"jaki"]];
    //提取数据
    NSArray * contacts = [store unifiedContactsMatchingPredicate:predicate keysToFetch:@[CNContactGivenNameKey,CNContactIdentifierKey] error:nil];
    NSLog(@"%@",contacts);
}

- (void)addresBookWrite {
     CNMutableContact * contact = [[CNMutableContact alloc] init];
    //设置名字
    contact.givenName = @"jaki";
    //设置姓氏
    contact.familyName = @"zhang";
    contact.phoneNumbers = @[[CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberiPhone value:[CNPhoneNumber phoneNumberWithStringValue:@"12344312321"]]];
    //初始化方法
    CNSaveRequest * saveRequest = [[CNSaveRequest alloc]init];
    //添加联系人
    [saveRequest addContact:contact toContainerWithIdentifier:nil];
    CNContactStore * store = [[CNContactStore alloc]init];
    [store executeSaveRequest:saveRequest error:nil];
}

- (void)addressBookDelete {
    __block CNContactStore * store = [[CNContactStore alloc]init];
    //检索条件，检索所有名字中有zhang的联系人
    NSPredicate * predicate = [CNContact predicateForContactsMatchingName:@"jaki"];
    //提取数据
    NSArray * contacts = [store unifiedContactsMatchingPredicate:predicate keysToFetch:@[CNContactGivenNameKey] error:nil];
    [contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CNSaveRequest *deleteRequest = [[CNSaveRequest alloc] init];
        [deleteRequest deleteContact:[obj mutableCopy]];
        [store executeSaveRequest:deleteRequest error:nil];
    }];
}

- (void)addressBookModify {
    
}


@end
