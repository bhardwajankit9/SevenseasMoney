//
//  ManageContactsViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/7/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "ManageContactsViewController.h"
#import "YSLContainerViewController.h"
#import "ManageVPAViewController.h"
#import "ManageBankAccountsViewController.h"

@interface ManageContactsViewController ()<YSLContainerViewControllerDelegate>

@end

@implementation ManageContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Manage Contact";
    [self SetuptabelView];
    // Do any additional setup after loading the view.
}

-(void)SetuptabelView{
    ManageVPAViewController *manageVPAVC = [[ManageVPAViewController alloc]initWithNibName:@"ManageVPAViewController" bundle:nil];
    manageVPAVC.title = @"VPAS";
    
    ManageBankAccountsViewController *manageBankAccountsVC = [[ManageBankAccountsViewController alloc]initWithNibName:@"ManageBankAccountsViewController" bundle:nil];
    manageBankAccountsVC.title = @"Bank Accounts";
    
    
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[manageVPAVC,manageBankAccountsVC]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
