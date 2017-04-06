//
//  WaterViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "WaterViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "UIColor+TKColor.h"
#import "UIFont+TKFont.h"

@interface WaterViewController ()

@end

@implementation WaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view layoutIfNeeded];

    self.navigationItem.title = @"Water Bill Payment";
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
    [self.waterOpearatorTextField setTextFieldStyle:TKTextFieldStyleUserName withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.waterOpearatorTextField.textColor = [UIColor TKBlackColor];
    self.waterOpearatorTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select Water Operator" attributes:@{NSForegroundColorAttributeName: [UIColor TKBlackColor]}];
    
    [self.numberTextField setTextFieldStyle:TKTextFieldStyleEmailId withFontSize:16 withBorderColor:[UIColor TKGreenishBlueColor]];
    self.numberTextField.textColor = [UIColor TKBlackColor];
    self.numberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter User Number" attributes:@{NSForegroundColorAttributeName: [UIColor TKGrayColor]}];
    self.numberTextField.keyboardType = UIKeyboardTypePhonePad;

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
