//
//  LandlineViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "LandlineViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "UIColor+TKColor.h"
#import "UIFont+TKFont.h"

@interface LandlineViewController ()

@end

@implementation LandlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Landline Bill Payment";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self SetText];

    // Do any additional setup after loading the view.
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
    
    [self.numberTextField setTextFieldStyle:TKTextFieldStyleEmailId withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.numberTextField.textColor = [UIColor TKBlackColor];
    self.numberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter User Name" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    
    [self.amountTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.amountTextField.textColor = [UIColor TKBlackColor];
    self.amountTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Amount" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.amountTextField.keyboardType = UIKeyboardTypePhonePad;
    
    
    
    
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
