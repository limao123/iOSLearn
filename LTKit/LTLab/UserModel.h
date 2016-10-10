//
//  UserModel.h
//  LTKit
//
//  Created by bmob-LT on 16/10/10.
//  Copyright © 2016年 bmob-LT. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 
 //原来的代码
typedef enum{
    UserSex_Man,
    UserSex_Woman
}UserSex;

@interface UserModel :NSObject


@property (nonatomic,strong) NSString *name;
@property (assign,nonatomic) int age;
@property (nonatomic,assign) UserSex sex;

-(id)initUserModelWithUserName: (NSString*)name withAge:(int)age;


 -(void)doLogIn;

@end
 */


/****************以下为修改*******************/
//优化
// 如果工程项目非常庞大，需要拆分成不同的模块，可以在类、typedef宏命名的时候使用前缀。

typedef enum{
    UserSex_Man,
    UserSex_Woman
}UserSex;
/*
 硬伤
 1.enum 中驼峰命名法和下划线命名法混用错误：枚举类型的命名规则和函数的命名规则相同：命名时使用驼峰命名法，勿使用下划线命名法。
 2.enum 左括号前加一个空格，或者将左括号换到下一行，右括号后加一个空格

 
typedef enum {
    UserSexMan,
    UserSexWoman
} UserSex;
 
 优化
 1.enum 建议使用 NS_ENUM 和 NS_OPTIONS 宏来定义枚举类型
 //定义一个枚举
 typedef NS_ENUM(NSInteger, UserSex) {
    UserSexMan,
    UserSexWoman
 };
 
 2.UserSex如果改为Sex 会更加简洁，而且足够清晰。
 
 */

/*
 硬伤
 右侧少了一个空格
 @interface UserModel : NSObject
 
 优化
 UserModel 如果改为 User 会更加简洁，而且足够清晰。
 */
@interface UserModel :NSObject
//@interface 与 @property 属性声明中间应当间隔一行。

@property (nonatomic,strong) NSString *name;
/*
 1.使用copy
 @property (nonatomic,copy) NSString *name;
 
 2.属性的参数应该按照下面的顺序排列： 原子性，读写 和 内存管理。 这样做你的属性更容易修改正确，并且更好阅读。以下两种属性有同样问题
 */

@property (assign,nonatomic) int age;
/*
 age 属性的类型：应避免使用基本类型，建议使用 Foundation 数据类型
 @property (assign,nonatomic) NSUInteger age;
 */
@property (nonatomic,assign) UserSex sex;

//两个方法定义之间不需要换行，有时为了区分方法的功能也可间隔一行，但示例代码中间隔了两行。
-(id)initUserModelWithUserName: (NSString *)name withAge:(int)age;
/*
 硬伤
 1.在-和(id)之间应该有一个空格
 2.方法中方法名与参数之间多了空格。
 3.NSString 与*少了一个空格
- (id)initUserModelWithUserName:(NSString *)name withAge:(int)age;
 
 优化
 1.不要使用with来连接
 - (instancetype)initWithName:(NSString *)name age:(NSUInteger)age;
 
 2.没有给sex设置初始值
 - (instancetype)initWithName:(NSString *)name age:(NSUInteger)age sex:(LTSex)sex;
 
 3.使用instancetype而不是id
 
 4.initUserModelWithUserName 如果改为 initWithName 会更加简洁，而且足够清晰。
 */

-(void)doLogIn;
/*
 硬伤
1.-与(void)之间应该有一个空格
 - (void)doLogIn;
 
 优化
1.doLogIn方法不应写在该类中
2.doLogIn 方法命名不规范：添加了多余的动词前缀。
如果方法表示让对象执行一个动作，使用动词打头来命名，注意不要使用 do，does 这种多余的关键字，动词本身的暗示就足够了。
应为 -logIn
 */

@end
