//
//  LandlineViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"
@interface LandlineViewController : UIViewController
@property (weak, nonatomic) IBOutlet TKTextField *numberTextField;
@property (weak, nonatomic) IBOutlet TKTextField *operatorTextField;
@property (weak, nonatomic) IBOutlet TKTextField *amountTextField;

@end
