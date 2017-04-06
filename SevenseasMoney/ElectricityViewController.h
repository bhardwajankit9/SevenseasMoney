//
//  ElectricityViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"
@interface ElectricityViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    
    NSArray *arrayElectricityOperatorName;
    
}

@property (weak, nonatomic) IBOutlet TKTextField *operatorNameTextField;
@property (weak, nonatomic) IBOutlet TKTextField *EnterCardNumber;
@property (weak, nonatomic) IBOutlet TKTextField *enterAmountTextField;
- (IBAction)billAmount:(id)sender;

@end
