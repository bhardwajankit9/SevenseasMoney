//
//  InsurenceViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"
@interface InsurenceViewController : UIViewController
@property (weak, nonatomic) IBOutlet TKTextField *operatorTextField;
@property (weak, nonatomic) IBOutlet TKTextField *policyNumberTextField;
@property (weak, nonatomic) IBOutlet TKTextField *dateTextField;

@end
