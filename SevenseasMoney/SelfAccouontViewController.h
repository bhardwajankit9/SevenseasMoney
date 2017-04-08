//
//  SelfAccouontViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/6/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelfAccouontViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *accountTableVIew;

@end
