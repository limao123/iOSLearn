//
//  DoubleComponentPickerViewController.m
//  07-Pickers
//
//  Created by 林涛 on 16/2/25.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentPickerViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (copy, nonatomic) NSArray *fillingTypes;
@property (copy, nonatomic) NSArray *breadTypes;

@end

@implementation DoubleComponentPickerViewController

- (IBAction)buttonPressed:(id)sender {
    
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadComponent];
    NSString *filling = self.fillingTypes[fillingRow];
    NSString *bread = self.breadTypes[breadRow];
    NSString *message = [NSString stringWithFormat:@"Your %@ on %@ bread will be right up.",filling,bread];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you for your order" message:message delegate:nil cancelButtonTitle:@"Great!" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fillingTypes = @[@"Ham",@"Turkey",@"Peanut Butter",@"Tuna Salad",@"Chicken Salad",@"Roast Beef",@"Vegemite"];
    self.breadTypes = @[@"White",@"Whole Wheat",@"Rye",@"Sourdough",@"Seven Grain"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == kFillingComponent) {
        return self.fillingTypes.count;
    } else {
        return self.breadTypes.count;
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == kFillingComponent) {
        return self.fillingTypes[row];
    } else {
        return self.breadTypes[row];
    }
}

@end
