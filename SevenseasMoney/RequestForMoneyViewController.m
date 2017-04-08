//
//  RequestForMoneyViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/6/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "RequestForMoneyViewController.h"
#import "YSLContainerViewController.h"
#import "RequestMoneyForContactViewController.h"
#import "VPAContactViewController.h"
@interface RequestForMoneyViewController () <YSLContainerViewControllerDelegate>

@end

@implementation RequestForMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Request For Money";
    [self SetuptabelView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)SetuptabelView{
    RequestMoneyForContactViewController *requestForMoneyVC = [[RequestMoneyForContactViewController alloc]initWithNibName:@"RequestMoneyForContactViewController" bundle:nil];
    requestForMoneyVC.title = @"CONTACTS";
    
    VPAContactViewController *vpaContactVC = [[VPAContactViewController alloc]initWithNibName:@"VPAContactViewController" bundle:nil];
    vpaContactVC.title = @"VPAS";
    
    
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[requestForMoneyVC,vpaContactVC]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
