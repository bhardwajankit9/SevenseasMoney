//
//  RechargeViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/29/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "RechargeViewController.h"
#import "TKTextField.h"
#import "UIColor+TKColor.h"
#import "UIViewController+V2CustomViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "NSString+Validation.h"
#import "V2ValidationNotifier.h"

@interface RechargeViewController ()< ABPeoplePickerNavigationControllerDelegate>

@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];

    self.navigationItem.title = @"Sevenseas Money";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self setText];
   

    // Do any additional setup after loading the view.
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self setText];
    [self.view layoutIfNeeded];
}

- (void) setText {
    [self.mobileNumberTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKTextFieldBorderColor]];
    self.mobileNumberTextField.textColor = [UIColor TKBlackColor];
    self.mobileNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.mobileNumberTextField.keyboardType = UIKeyboardTypePhonePad;

}

- (void)indicateValidation{
    self.mobileNumberTextField.status = [self mobileTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    [self showValidationAlert];
    
}

- (void)showValidationAlert{
    V2Validation validationMask = 0;
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self mobileTextIsValid] && [self mobileTextIsNonEmpty]);
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self mobileTextIsNonEmpty]);
    [V2ValidationNotifier showAlertForValidations:validationMask];
}

- (BOOL)formIsValid
{
    BOOL result = YES;
    
    result &= [self mobileTextIsValid];
    
    return result;
}
- (BOOL)mobileTextIsNonEmpty{
    BOOL result = YES;
    NSString *text = self.mobileNumberTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)mobileTextIsValid{
    BOOL result = YES;
    NSString *text = self.mobileNumberTextField.text;
    result &= [text isValidEmail];
    return result;
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

- (IBAction)contactListButton:(id)sender {
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    picker.predicateForEnablingPerson = [NSPredicate predicateWithFormat:@"%K.@count > 0", ABPersonPhoneNumbersProperty];
    
    [self.navigationController presentViewController:picker animated:YES completion:nil];
}
@end
