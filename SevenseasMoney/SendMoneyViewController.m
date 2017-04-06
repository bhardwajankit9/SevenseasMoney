//
//  SendMoneyViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/5/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "SendMoneyViewController.h"
#import "MoneyTransferViewController.h"
@interface SendMoneyViewController ()

@end

@implementation SendMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
@end
