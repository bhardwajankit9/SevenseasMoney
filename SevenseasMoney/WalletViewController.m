//
//  WalletViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/30/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "WalletViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "YSLContainerViewController.h"
#import "PaidViewController.h"
#import "ReceivedViewController.h"
#import "AddedViewController.h"

@interface WalletViewController () <YSLContainerViewControllerDelegate>

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Wallet Balance";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self SetuptabelView];

}

//- (void) setUp {
//    
//    self.sliderMenu = [[YSLScrollMenuView alloc]initWithFrame:CGRectMake(0, _topBarHeight, self.view.frame.size.width, kYSLScrollMenuViewHeight)];
//    _sliderMenu.backgroundColor = [UIColor colorWithRed:37.0/255.0f green:37.0/255.0f blue:37.0/255.0f alpha: 1.0];
//    _menuView.delegate = self;
//    _menuView.viewbackgroudColor = self.menuBackGroudColor;
//    _menuView.itemfont = self.menuItemFont;
//    _menuView.itemTitleColor = self.menuItemTitleColor;
//    _menuView.itemIndicatorColor = self.menuIndicatorColor;
//    _menuView.scrollView.scrollsToTop = NO;
//    [_menuView setItemTitleArray:self.titles];
//    [self.view addSubview:_menuView];
//    [_menuView setShadowView];
//    
//    [self scrollMenuViewSelectedIndex:0];
//}

-(void)SetuptabelView{
    PaidViewController *paidVC = [[PaidViewController alloc]initWithNibName:@"PaidViewController" bundle:nil];
    paidVC.title = @"PAID";
    
    ReceivedViewController *receivedVC = [[ReceivedViewController alloc]initWithNibName:@"ReceivedViewController" bundle:nil];
    receivedVC.title = @"RECEIVED";
    
    AddedViewController *addedVC = [[AddedViewController alloc]initWithNibName:@"AddedViewController" bundle:nil];
    addedVC.title = @"ADDED";
    
    
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[paidVC,receivedVC,addedVC]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
