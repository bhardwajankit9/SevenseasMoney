//
//  DataViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/31/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTextField.h"
@interface DataViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    
    NSArray *arrayDataCardOperatorName;
}
@property (weak, nonatomic) IBOutlet TKTextField *operatorNameTextField;
@property (weak, nonatomic) IBOutlet TKTextField *dataCardNumberTextField;
@property (weak, nonatomic) IBOutlet TKTextField *amountTextField;

@end
