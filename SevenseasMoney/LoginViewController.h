//
//  LoginViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/28/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"
#import "RegisterViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@class RegisterViewController;

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet TKTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet TKTextField *mobileNumberTextField;
@property (weak, nonatomic) IBOutlet UIImageView *LogoImage;
- (IBAction)loginButton:(id)sender;
- (IBAction)registerButton:(id)sender;
- (IBAction)forgotPasswordButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *registerHereButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotButton;
@property (strong,nonatomic) RegisterViewController *loginObject;


@end
