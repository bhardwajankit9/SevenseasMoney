//
//  DTHViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"

@interface DTHViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    
        NSArray *arrayDTHOperatorName;
    
}
@property (weak, nonatomic) IBOutlet TKTextField *operatorNameTextField;
@property (weak, nonatomic) IBOutlet TKTextField *userIDTextField;
@property (weak, nonatomic) IBOutlet TKTextField *amountTextField;

@end
