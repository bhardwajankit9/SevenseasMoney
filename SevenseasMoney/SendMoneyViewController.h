//
//  SendMoneyViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/5/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V2ImageView.h"
@interface SendMoneyViewController : UIViewController
- (IBAction)sendButton:(id)sender;
@property (weak, nonatomic) IBOutlet V2ImageView *sendView;
- (IBAction)selfButtonAction:(id)sender;
- (IBAction)RequestButtonAction:(id)sender;
- (IBAction)manageContactAction:(id)sender;
- (IBAction)uipFAQAction:(id)sender;


@end
