//
//  WalletViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/30/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YSLContainerViewController.h>

@class YSLContainerViewController;

@interface WalletViewController : UIViewController
- (IBAction)paidButtonAction:(id)sender;
- (IBAction)receivedButtonAction:(id)sender;
- (IBAction)addedButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *walletTableView;
@property (weak, nonatomic) IBOutlet UIView *paidView;
@property (weak, nonatomic) IBOutlet UIView *receivedView;
@property (weak, nonatomic) IBOutlet UIView *addedView;
@property (strong, nonatomic) YSLContainerViewController *sliderMenu;

@end
