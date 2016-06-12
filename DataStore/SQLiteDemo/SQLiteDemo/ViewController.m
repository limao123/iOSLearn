//
//  ViewController.m
//  SQLiteDemo
//
//  Created by 林涛 on 16/6/10.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    [self createDataBase];
    //    [self saveData];
    //    [self getData];
    [self createTable:@"CREATE TABLE IF NOT EXISTS User (username text, objectId text,unique (objectId))"];
    [self createTable:@"CREATE TABLE IF NOT EXISTS Problem (problem text,answer text,source text,objectId text,unique (objectId))"];
    [self createTable:@"CREATE TABLE IF NOT EXISTS FavouriteProblem (p_user text,p_problem text)"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createDataBase{
    //打开数据库
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0,@"Failed to open database");
    }
    
    //不存在时创建一张新表
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS (ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT)";
    char *errorMsg;
    if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Error creating table:%s",errorMsg);
    } else {
        NSLog(@"success create");
    }
    
    //关闭数据库
    sqlite3_close(database);
}

- (void)createTable:(NSString *)SQL{
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0,@"Failed to open database");
    }
    
    //不存在时创建一张新表
    char *errorMsg;
    if (sqlite3_exec(database, [SQL UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"Error creating table:%s",errorMsg);
    }
    
    //关闭数据库
    sqlite3_close(database);
}

- (void)saveData{
    //打开数据库
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0,@"Failed to open database");
    }
    
    //操作数据库
    for (int i = 0; i < 4; i++) {
        char *update = "INSERT OR REPLACE INTO FIELDS (ROW,FIELD_DATA) VALUES (?,?);";
        char *errorMsg = NULL;
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i);
            sqlite3_bind_text(stmt, 2, [[NSString stringWithFormat:@"hello %d",i] UTF8String], -1, NULL);
        }
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            NSAssert(0, @"Error updating table: %s",errorMsg);
        }
        sqlite3_finalize(stmt);
    }
    
    //关闭数据库
    sqlite3_close(database);
}

- (void)getData{
    //打开数据库
    sqlite3 *database;
    if (sqlite3_open([[self dataFilePath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0,@"Failed to open database");
    }
    
    
    
    //从表中读取数据
    NSString *query = @"SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW;";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int row = sqlite3_column_int(statement, 0);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            NSString *fieldValue = [[NSString alloc] initWithUTF8String:rowData];
            NSLog(@"row:%d field_data:%@",row,fieldValue);
        }
        sqlite3_finalize(statement);
    }
    
    //关闭数据库
    sqlite3_close(database);
}


- (NSString *)dataFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucmentsDirectory = paths[0];
    return [doucmentsDirectory stringByAppendingPathComponent:@"data.sqlite"];
}

@end
