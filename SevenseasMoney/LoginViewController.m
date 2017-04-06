//
//  LoginViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/28/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "LoginViewController.h"
#import "TKTextField.h"
#import "UIColor+TKColor.h"
#import "UIViewController+V2CustomViewController.h"
#import "NSString+Validation.h"
#import "V2ValidationNotifier.h"
#import "DashboardViewController.h"
@interface LoginViewController (){
    LAContext *mycontext;
}


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Sevenseas Money";
    [self NavigationbarInfo];
    [self infoButtonNavigationBar];
    [self.view layoutIfNeeded];

//    self.loginObject = [[LoginViewController alloc] init];

    //    [self.navigationController.navigationBar setTitleTextAttributes:
//     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    self.navigationItem.hidesBackButton = true;
////    [self backButtonForNavigationBar];
//    [self infoButtonNavigationBar];
//    UINavigationBar *bar = [self.navigationController navigationBar];
//    [bar setBackgroundColor:[UIColor blackColor]];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginImage"]];
//    CGSize imageSize = CGSizeMake(25, 25);
//    CGFloat marginX = (self.navigationController.navigationBar.frame.size.width / 2) - (imageSize.width / 2);
//    
//    imageView.frame = CGRectMake(85, 10, imageSize.width, imageSize.height);
//    [self.navigationController.navigationBar addSubview:imageView];
//    
//    [imgView setImage:img];
//    // setContent mode aspect fit
//    [imgView setContentMode:UIViewContentModeScaleAspectFit];
//    self.navigationItem.titleView = imgView;
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginImage"]];
   

}



-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setText];
    [self.view layoutIfNeeded];
}


- (void) setText {
    [self.passwordTextField setTextFieldStyle:TKTextFieldStylePassword withFontSize:16 withBorderColor:[UIColor TKWhite50BorderTextFieldColor]];
    self.passwordTextField.textColor = [UIColor TKWhiteTextColor];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Your Password" attributes:@{NSForegroundColorAttributeName: [UIColor TKWhite50BorderTextFieldColor]}];
    [self.mobileNumberTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKWhite50BorderTextFieldColor]];
    self.mobileNumberTextField.textColor = [UIColor TKWhiteTextColor];
    self.mobileNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Mobile Number" attributes:@{NSForegroundColorAttributeName: [UIColor TKWhite50BorderTextFieldColor]}];
//    self.mobileNumberTextField.attributedPlaceholder = [UIColor whiteColor];
    self.mobileNumberTextField.keyboardType = UIKeyboardTypePhonePad;
//    [_mobileNumberTextField setShowsTouchWhenHighlighted:YES];



}

- (void)indicateValidation{
    self.mobileNumberTextField.status = [self mobileTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    self.passwordTextField.status = [self passwordTextIsValid]?V2TextFieldStatusDefault:V2TextFieldStatusError;
    [self showValidationAlert];
    
}

- (void)showValidationAlert{
    V2Validation validationMask = 0;
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self mobileTextIsValid] && [self mobileTextIsNonEmpty]);
    SET_FLAG(validationMask, V2ValidationPhoneNumber, ![self mobileTextIsNonEmpty]);
    SET_FLAG(validationMask, V2ValidationPasswordSignInEmpty, ![self passwordTextIsEmpty]);
    SET_FLAG(validationMask, V2ValidationPassword, ![self passwordTextIsValid] &&  [self passwordTextIsEmpty]);
    [V2ValidationNotifier showAlertForValidations:validationMask];
}


- (BOOL)formIsValid
{
    BOOL result = YES;
    
    result &= [self mobileTextIsValid];
    result &= [self passwordTextIsValid];
    
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

- (BOOL)passwordTextIsEmpty{
    BOOL result = YES;
    NSString *text = self.passwordTextField.text;
    result &= [text isNonempty];
    //result &= [text hasMinimumLength:6];
    return result;
}
- (BOOL)passwordTextIsValid{
    BOOL result = YES;
    NSString *text = self.passwordTextField.text;
    //result &= [text isNonempty];
    result &= [text hasMinimumLength:6];
    return result;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(id)sender {
    DashboardViewController *loginViewController = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"DashboardViewController"];
    [self.navigationController pushViewController:loginViewController animated:YES];

    
//    NSError *error = nil;
//    //self.thumbButton.enabled=false;
//   // self.v2SpinnerView.hidden=false;
//    mycontext.localizedFallbackTitle = @"";
//    [mycontext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Place your configured thumb or finger against the Home Button to authenticate." reply:^(BOOL success, NSError *authenticationError) {
//        if (success) {
//            
//            
//            //            message = @"evaluatePolicy: succes";
//           // [self showMessage:success];
//        }
//        else {
//            //            message = [NSString stringWithFormat:@"evaluatePolicy: %@", authenticationError.localizedDescription];
//          //  [self showMessage:success];
//        }
//        
    
    //}];

//    [self indicateValidation];
//    if (![self formIsValid]) {
//        return;
//    }
//    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Success...!!!" message:@"Sign in  Successfully" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* ok = [UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
//        [alertController dismissViewControllerAnimated:YES completion:nil];
//    }];
//    [alertController addAction: ok];
//    [self presentViewController:alertController animated:YES completion:nil];

    
}

- (IBAction)registerButton:(id)sender {
    if ([[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2] isKindOfClass:[self.loginObject class]]) {
        for (UIViewController *controller in self.navigationController.viewControllers){
            if ([controller isKindOfClass:[RegisterViewController class]]){
                [self.navigationController popToViewController:controller animated:YES];
                break;
            }
        }
    }else{
        [self.navigationController showViewController:self.loginObject sender:self];
    }

}

- (IBAction)forgotPasswordButton:(id)sender {
}
@end
