//
//  MoneyTransferViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/5/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "MoneyTransferViewController.h"
#import "YSLContainerViewController.h"
#import "ContactTableViewController.h"
#import "VPASTableViewController.h"
#import "BankAccountTableViewController.h"
#import "UIViewController+V2CustomViewController.h"

@interface MoneyTransferViewController () <YSLContainerViewControllerDelegate>

@end

@implementation MoneyTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Send Money";
    [self NavigationbarInfo];
    [self infoButtonNavigationBar];
    [self.view layoutIfNeeded];

    [self SetuptabelView];
    // Do any additional setup after loading the view from its nib.
}

-(void)SetuptabelView{
    ContactTableViewController *contactViewController = [[ContactTableViewController alloc]initWithNibName:@"ContactTableViewController" bundle:nil];
    contactViewController.title = @"Contact";

    VPASTableViewController *vpasViewController = [[VPASTableViewController alloc]initWithNibName:@"VPASTableViewController" bundle:nil];
    vpasViewController.title = @"VPAS";

    BankAccountTableViewController *bankAccountViewController = [[BankAccountTableViewController alloc]initWithNibName:@"BankAccountTableViewController" bundle:nil];
    bankAccountViewController.title = @"Bank Account";

    
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[contactViewController,vpasViewController,bankAccountViewController]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];


}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
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
