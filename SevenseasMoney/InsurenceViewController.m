//
//  InsurenceViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "InsurenceViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "UIColor+TKColor.h"
#import "UIFont+TKFont.h"

@interface InsurenceViewController (){
    UIDatePicker *dpDatePicker;
}

@end

@implementation InsurenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];

    self.navigationItem.title = @"Insurence Premium Payment";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self SetText];
    dpDatePicker = [[UIDatePicker alloc] init];
    dpDatePicker.datePickerMode = UIDatePickerModeDate;
    [dpDatePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    dpDatePicker.timeZone = [NSTimeZone defaultTimeZone];
    dpDatePicker.minuteInterval = 5;
    
    [_dateTextField setInputView:dpDatePicker];
    // Do any additional setup after loading the view.
}

- (void)datePickerValueChanged:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-DD-YYYY"];
    _dateTextField.text = [dateFormatter stringFromDate:dpDatePicker.date];
   
}


-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
   // [self SetText];
    [self.view layoutIfNeeded];
}


-(void) SetText{
    [self.operatorTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.operatorTextField.textColor = [UIColor TKBlackColor];
    self.operatorTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select Operator Name" attributes:@{NSForegroundColorAttributeName: [UIColor TKBlackColor]}];
    
    [self.dateTextField setTextFieldStyle:TKTextFieldStyleEmailId withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.dateTextField.textColor = [UIColor TKBlackColor];
    self.dateTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter DOB" attributes:@{NSForegroundColorAttributeName: [UIColor TKBlackColor]}];
    
    [self.policyNumberTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.policyNumberTextField.textColor = [UIColor TKBlackColor];
    self.policyNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Policy Number" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.policyNumberTextField.keyboardType = UIKeyboardTypePhonePad;
     
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
