//
//  MoneyTransferViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/5/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "MoneyTransferViewController.h"
#import "YSLContainerViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "ContactListViewController.h"
#import "VPASListViewController.h"
#import "BankListViewController.h"

@interface MoneyTransferViewController () <YSLContainerViewControllerDelegate>

@end

@implementation MoneyTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Send Money";

    //self.navigationItem.title = @"Send Money";
    [self NavigationbarInfo];
   // [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];

    [self SetuptabelView];
    // Do any additional setup after loading the view from its nib.
}

-(void)SetuptabelView{
    ContactListViewController *contactViewController = [[ContactListViewController alloc]initWithNibName:@"ContactListViewController" bundle:nil];
    contactViewController.title = @"CONTACT";

    VPASListViewController *vpasViewController = [[VPASListViewController alloc]initWithNibName:@"VPASListViewController" bundle:nil];
    vpasViewController.title = @"VPAS";

    BankListViewController *bankAccountViewController = [[BankListViewController alloc]initWithNibName:@"BankListViewController" bundle:nil];
    bankAccountViewController.title = @"BANK CONTACT";

    
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
