//
//  SendMoneyViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/5/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "SendMoneyViewController.h"
#import "MoneyTransferViewController.h"
#import "SelfAccouontViewController.h"
#import "RequestForMoneyViewController.h"
#import "ManageContactsViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "UPIFaqViewController.h"
@interface SendMoneyViewController ()

@end

@implementation SendMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Send Money";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self NavigationbarInfo];
//    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
   // [self sendView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{

    self.navigationItem.title = @"Send Money";

}


-(void)setView{
    
   //self.sendView.imageView.image = [UIImage imageNamed:@"image"];
    self.sendView.backgroundColor = [UIColor blackColor];
    [self.sendView setBorderColor:V2BorderWhite];
    [self.sendView setImageStyle:V2ImageStyleCircle];

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

- (IBAction)sendButton:(id)sender {
    
    MoneyTransferViewController *moneyTransferVC = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"MoneyTransferViewController"];
    [self.navigationController pushViewController:moneyTransferVC animated:YES];

}
- (IBAction)selfButtonAction:(id)sender {
    SelfAccouontViewController *selfAccountVC = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"selfAccouontViewController"];
    [self.navigationController pushViewController:selfAccountVC animated:YES];
    
}

- (IBAction)RequestButtonAction:(id)sender {
    RequestForMoneyViewController *requestForMoneyVC = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"RequestForMoneyViewController"];
    [self.navigationController pushViewController:requestForMoneyVC animated:YES];

}

- (IBAction)manageContactAction:(id)sender {
    
    ManageContactsViewController *manageContactsVC = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"manageContactsViewController"];
    [self.navigationController pushViewController:manageContactsVC animated:YES];

}

- (IBAction)uipFAQAction:(id)sender {
    
    UPIFaqViewController *upiFaqVC = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"uPIFaqViewController"];
    [self.navigationController pushViewController:upiFaqVC animated:YES];

}
@end
