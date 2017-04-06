//
//  RegisterViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/28/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"
#import "LoginViewController.h"

@class LoginViewController;

@interface RegisterViewController : UIViewController
- (IBAction)checkboxButton:(id)sender;
@property (weak, nonatomic) IBOutlet TKTextField *mobileTextField;
@property (weak, nonatomic) IBOutlet TKTextField *nameTextField;

@property (weak, nonatomic) IBOutlet TKTextField *emailTextField;
@property (weak, nonatomic) IBOutlet TKTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet TKTextField *confermPasswordTextField;
- (IBAction)registerButton:(id)sender;
- (IBAction)loginButton:(id)sender;

@property (strong,nonatomic) LoginViewController *siginObject;

@end
