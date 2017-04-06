//
//  ElectricityViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "ElectricityViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "UIColor+TKColor.h"
#import "UIFont+TKFont.h"
#import "NSString+Validation.h"
#import "V2ValidationNotifier.h"

@interface ElectricityViewController ()

@end

@implementation ElectricityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];

     arrayElectricityOperatorName = @[@"Assam Power Distribution Company Limited", @"Andhra Pradesh State Electricity Board", @"Uttar Haryana Bijli Vitran Nigam Limited", @"Goa Electricity Board", @"Kerala State Electricity Board", @"Southern Electricity Supply Company of Orissa", @"Southern Electricity Supply Company of Orissa"];
    [self pickerview:self];
    
    self.navigationItem.title = @"Electricity Bill Payment";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self SetText];


    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //[self SetText];
    [self.view layoutIfNeeded];
}


-(void) SetText{
    [self.operatorNameTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.operatorNameTextField.textColor = [UIColor TKBlackColor];
    self.operatorNameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select Operator Name" attributes:@{NSForegroundColorAttributeName: [UIColor TKBlackColor]}];
    
    [self.EnterCardNumber setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.EnterCardNumber.textColor = [UIColor TKBlackColor];
    self.EnterCardNumber.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Cycle Number" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.EnterCardNumber.keyboardType = UIKeyboardTypePhonePad;

    
    [self.enterAmountTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.enterAmountTextField.textColor = [UIColor TKBlackColor];
    self.enterAmountTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Amount" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.enterAmountTextField.keyboardType = UIKeyboardTypePhonePad;


}

- (void)indicateValidation{
    
    self.operatorNameTextField.status = [self userIDTextIsValid]?V2TextFieldStatusDefault:TKTextFieldWithPickerView;
    
    self.EnterCardNumber.status = [self amountTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    
    self.enterAmountTextField.status = [self amountTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    
    [self showValidationAlert];
    
}

- (void)showValidationAlert{
    V2Validation validationMask = 0;
   SET_FLAG(validationMask, V2ValidationOperatorName, ![self operatorTextIsNonEmpty]);
    
    SET_FLAG(validationMask, V2ValidationEmailSignInInvalid, ![self userIDTextIsValid] && [self userIDTextIsNonEmpty]);
    SET_FLAG(validationMask, V2ValidationEmailSignInEmpty, ![self userIDTextIsNonEmpty]);
    
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self amountTextIsNonEmpty]);
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self amountTextIsValid] && [self amountTextIsNonEmpty]);
    
    [V2ValidationNotifier showAlertForValidations:validationMask];
}

- (BOOL)formIsValid
{
    BOOL result = YES;
    result &= [self operatorTextIsNonEmpty];

    result &= [self userIDTextIsValid];
    result &= [self amountTextIsValid];
    
    return result;
}

- (BOOL)operatorTextIsNonEmpty{
    BOOL result = YES;
    NSString *text = self.operatorNameTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)userIDTextIsNonEmpty{
    BOOL result = YES;
    NSString *text = self.EnterCardNumber.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)userIDTextIsValid{
    BOOL result = YES;
    NSString *text = self.EnterCardNumber.text;
    result &= [text isValidPhoneNumber10];
    return result;
}


- (BOOL)amountTextIsNonEmpty{
    BOOL result = YES;
    NSString *text = self.enterAmountTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)amountTextIsValid{
    BOOL result = YES;
    NSString *text = self.enterAmountTextField.text;
    result &= [text isValidPhoneNumber10];
    return result;
}





-(void)pickerview:(id)sender{
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    pickerView.showsSelectionIndicator = YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    //[pickerView setBackgroundColor:[UIColor whiteColor]];
    
    // set change the inputView (default is keyboard) to UIPickerView
    _operatorNameTextField.inputView = pickerView;
    
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
    return [arrayElectricityOperatorName count];
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow: (NSInteger)row forComponent:(NSInteger)component{
    return arrayElectricityOperatorName[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.operatorNameTextField.text = arrayElectricityOperatorName[row];
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

- (IBAction)billAmount:(id)sender {
    [self indicateValidation];
    if (![self formIsValid]) {
        return;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success...!!!" message:@"Sign in  Successfully" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction: ok];
    [self presentViewController:alertController animated:YES completion:nil];

}
@end
