//
//  OfferViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "OfferViewController.h"
#import "UIViewController+V2CustomViewController.h"

@interface OfferViewController ()

@end

@implementation OfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Sevenseas Money";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
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

@end
