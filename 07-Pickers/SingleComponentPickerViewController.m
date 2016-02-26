//
//  SingleComponentPickerViewController.m
//  07-Pickers
//
//  Created by 林涛 on 16/2/25.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (copy, nonatomic) NSArray *characterNames;

@end

@implementation SingleComponentPickerViewController

- (IBAction)buttonPressed:(id)sender {
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!",selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"Thank you for choosing" delegate:nil cancelButtonTitle:@"You're Welcome" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.characterNames = @[@"Luke",@"Leia",@"Han",@"Chewbacca",@"Artoo",@"Threepio",@"Lando"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods

//滚轮数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//数据行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
//每行显示内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.characterNames[row];
}

@end
