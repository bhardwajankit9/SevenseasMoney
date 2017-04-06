//
//  RechargeViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/29/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"

@interface RechargeViewController : UIViewController
@property (weak, nonatomic) IBOutlet TKTextField *mobileNumberTextField;
- (IBAction)contactListButton:(id)sender;

@end
