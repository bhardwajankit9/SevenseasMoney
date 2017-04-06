//
//  DataViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "DataViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "UIColor+TKColor.h"
#import "UIFont+TKFont.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];

    arrayDataCardOperatorName = @[@"Reliance Net Connect", @"Vodafone 4G Data", @"Airtel 4G Data Card:", @"Tata Photon Plus: ", @"Tata Docomo 4G e-stick", @"Idea net setter", @"MTS Blaze Data Card",@"BSNL 4G Modem",@"3G Modem:MTNL"];
    
    [self pickerview:self];
    
    self.navigationItem.title = @"Data Recharge or Bill Payment";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self SetText];
    // Do any additional setup after loading the view.
}

-(void) SetText{
    [self.operatorNameTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.operatorNameTextField.textColor = [UIColor TKBlackColor];
    self.operatorNameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select Operator Name" attributes:@{NSForegroundColorAttributeName: [UIColor TKBlackColor]}];
    
    [self.dataCardNumberTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.dataCardNumberTextField.textColor = [UIColor TKBlackColor];
    self.dataCardNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Data Card Number" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.dataCardNumberTextField.keyboardType = UIKeyboardTypePhonePad;

    
    [self.amountTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.amountTextField.textColor = [UIColor TKBlackColor];
    self.amountTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Amount" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    
    self.amountTextField.keyboardType = UIKeyboardTypePhonePad;

    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
   // [self SetText];
    [self.view layoutIfNeeded];
}


-(void)pickerview:(id)sender{
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    pickerView.showsSelectionIndicator = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    //[pickerView setBackgroundColor:[UIColor whiteColor]];
    
    // set change the inputView (default is keyboard) to UIPickerView
    self.operatorNameTextField.inputView = pickerView;
    
    // add a toolbar with Cancel & Done button
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.barStyle = UIBarStyleBlackOpaque;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    // the middle button is to make the Done button align to right
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButton, nil]];
    self.operatorNameTextField.inputAccessoryView = toolBar;
}

#pragma mark - doneTouched
- (void)cancelTouched:(UIBarButtonItem *)sender{
    [self.operatorNameTextField resignFirstResponder];
}

#pragma mark - doneTouched
- (void)doneTouched:(UIBarButtonItem *)sender{
    [self.operatorNameTextField resignFirstResponder];
}

#pragma mark - The Picker Challenge
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [arrayDataCardOperatorName count];
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow: (NSInteger)row forComponent:(NSInteger)component{
    return arrayDataCardOperatorName[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.operatorNameTextField.text = arrayDataCardOperatorName[row];
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
