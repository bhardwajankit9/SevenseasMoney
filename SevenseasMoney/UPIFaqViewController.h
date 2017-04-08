//
//  UPIFaqViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/7/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPIFaqViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *faqTableView;
@property (strong, nonatomic) NSMutableArray *faqArray;
@property (strong, nonatomic) NSMutableArray *faqQuestionArray;
@property (strong, nonatomic) NSMutableArray *faqDetailArray;

@end
