//
//  RegisterViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/28/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "RegisterViewController.h"
#import "TKTextField.h"
#import "UIViewController+V2CustomViewController.h"
#import "UIColor+TKColor.h"
#import "UIFont+TKFont.h"
#import "NSString+Validation.h"
#import "V2ValidationNotifier.h"

@interface RegisterViewController (){
    BOOL checkBoxSelected;
}
@property (weak, nonatomic) IBOutlet UIButton *checkBox;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];

    self.navigationItem.title = @"Sevenseas Money";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self setTextField];
    // Do any additional setup after loading the view.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self setTextField];
    [self.view layoutIfNeeded];
}

-(void)navigationItemTitleStyle {
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor TKWhiteTextColor],
       NSFontAttributeName:[UIFont TKTykoonNavigationBarTitleFont]}];
}

- (void) setTextField{
    [self.mobileTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKWhite50BorderTextFieldColor]];
    self.mobileTextField.textColor = [UIColor TKWhiteTextColor];
    self.mobileTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Mobile Number" attributes:@{NSForegroundColorAttributeName: [UIColor TKWhite50BorderTextFieldColor]}];
    self.mobileTextField.keyboardType = UIKeyboardTypePhonePad;

    [self.nameTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKWhite50BorderTextFieldColor]];
    self.nameTextField.textColor = [UIColor TKWhiteTextColor];
    self.nameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter your Name" attributes:@{NSForegroundColorAttributeName: [UIColor TKWhite50BorderTextFieldColor]}];
    
    [self.emailTextField setTextFieldStyle:TKTextFieldStyleEmailId withFontSize:16 withBorderColor:[UIColor TKWhite50BorderTextFieldColor]];
    self.emailTextField.textColor = [UIColor TKWhiteTextColor];
    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor TKWhite50BorderTextFieldColor]}];
    
    [self.passwordTextField setTextFieldStyle:TKTextFieldStylePassword withFontSize:16 withBorderColor:[UIColor TKWhite50BorderTextFieldColor]];
    self.passwordTextField.textColor = [UIColor TKWhiteTextColor];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Set your Password" attributes:@{NSForegroundColorAttributeName: [UIColor TKWhite50BorderTextFieldColor]}];
    
    [self.confermPasswordTextField setTextFieldStyle:TKTextFieldStylePassword withFontSize:16 withBorderColor:[UIColor TKWhite50BorderTextFieldColor]];
    self.confermPasswordTextField.textColor = [UIColor TKWhiteTextColor];
    self.confermPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm your Password" attributes:@{NSForegroundColorAttributeName: [UIColor TKWhite50BorderTextFieldColor]}];

}

- (void)indicateValidation{
     self.mobileTextField.status = [self mobileTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    self.nameTextField.status = [self userNameIsNonEmpty]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    self.emailTextField.status = [self emailTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    self.passwordTextField.status = [self passwordTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    self.confermPasswordTextField.status = [self passwordTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    [self showValidationAlert];
    
}
- (void)showValidationAlert{
    V2Validation validationMask = 0;
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self mobileTextIsNonEmpty]);
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self mobileTextIsValid] && [self mobileTextIsNonEmpty]);
    
    SET_FLAG(validationMask, V2ValidationUserNameEmpty, ![self userNameIsNonEmpty]);
    
    SET_FLAG(validationMask, V2ValidationEmailSignInInvalid, ![self emailTextIsValid] && [self emailTextIsNonEmpty]);
    SET_FLAG(validationMask, V2ValidationEmailSignInEmpty, ![self emailTextIsNonEmpty]);
    
    SET_FLAG(validationMask, V2ValidationPassword, ![self passwordTextIsValid] &&  [self passwordTextIsEmpty]);
    SET_FLAG(validationMask, V2ValidationPasswordSignInEmpty, ![self passwordTextIsEmpty]);
    
    [V2ValidationNotifier showAlertForValidations:validationMask];
}


- (BOOL)formIsValid
{
    BOOL result = YES;
    
    result &= [self emailTextIsValid];
    result &= [self passwordTextIsValid];
    
    return result;
}
- (BOOL)mobileTextIsNonEmpty{
    BOOL result = YES;
    NSString *text = self.mobileTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)mobileTextIsValid{
    BOOL result = YES;
    NSString *text = self.mobileTextField.text;
    result &= [text isValidPhoneNumber10];
    return result;
}

- (BOOL)userNameIsNonEmpty{
    BOOL result = YES;
    NSString *text = self.nameTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)emailTextIsNonEmpty{
    BOOL result = YES;
    NSString *text = self.emailTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)emailTextIsValid{
    BOOL result = YES;
    NSString *text = self.emailTextField.text;
    result &= [text isValidEmail];
    return result;
}

- (BOOL)passwordTextIsEmpty{
    BOOL result = YES;
    NSString *text = self.passwordTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)passwordTextIsValid{
    BOOL result = YES;
    NSString *text = self.passwordTextField.text;
    result &= [text hasMinimumLength:6];
    return result;
}
- (BOOL)confirmPasswordTextIsEmpty{
    BOOL result = YES;
    NSString *text = self.passwordTextField.text;
    result &= [text isNonempty];
    return result;
}
- (BOOL)confirmPasswordTextIsValid{
    BOOL result = YES;
    NSString *text = self.passwordTextField.text;
    result &= [text hasMinimumLength:6];
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
-(IBAction)clickCheckButton:(UIButton *)sender {
    

    if (checkBoxSelected == NO){
        [_checkBox setBackgroundImage:[UIImage imageNamed:@"CheckImage"]
                             forState:UIControlStateNormal];

    }else{
        [_checkBox setBackgroundImage:[UIImage imageNamed:@"NotSelected"]
                             forState:UIControlStateSelected];
    }
    checkBoxSelected = !checkBoxSelected; /* Toggle */
    [_checkBox setSelected:checkBoxSelected];
    
}
- (IBAction)registerButton:(id)sender {
    
    [self indicateValidation];
    if (![self formIsValid]) {
        return;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success...!!!" message:@"Register Successfully" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction: ok];
    [self presentViewController:alertController animated:YES completion:nil];

    
    
    
}

- (IBAction)loginButton:(id)sender {
//    LoginViewController *loginViewController = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
//    [self presentModalViewController:loginViewController animated:YES];
    LoginViewController *loginViewController = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:loginViewController animated:YES];
    //    if ([[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2] isKindOfClass:[self.siginObject class]]) {
//        for (UIViewController *controller in self.navigationController.viewControllers){
//            if ([controller isKindOfClass:[LoginViewController class]]){
//                [self.navigationController popToViewController:controller animated:YES];
//                break;
//            }
//        }
//    }else{
//        [self.navigationController showViewController:self.siginObject sender:self];
//    }

}
    @end
