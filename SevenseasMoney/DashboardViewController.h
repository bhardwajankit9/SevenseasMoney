//
//  DashboardViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/29/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIImagePager.h"
#import "RechargeViewController.h"

@interface DashboardViewController : UIViewController

@property (strong, nonatomic) UIPageViewController *pageViewController;

- (IBAction)menuButton:(id)sender;
@property (strong, nonatomic) NSArray *contentPhotos;
@property (weak, nonatomic) IBOutlet UIView *rechargeView;
@property (weak, nonatomic) IBOutlet UIView *moneyView;
@property (weak, nonatomic) IBOutlet UIView *travelView;
@property (weak, nonatomic) IBOutlet UIView *walletView;


@end
