//
//  GasViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "GasViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "UIColor+TKColor.h"
#import "UIFont+TKFont.h"

@interface GasViewController ()

@end

@implementation GasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLayoutSubviews];

    self.navigationItem.title = @"Gas Bill Payment";
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
    
    [self.customerNumberTextField setTextFieldStyle:TKTextFieldStyleEmailId withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.customerNumberTextField.textColor = [UIColor TKBlackColor];
    self.customerNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter User Number" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.customerNumberTextField.keyboardType = UIKeyboardTypePhonePad;

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
