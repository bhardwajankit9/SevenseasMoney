//
//  MenuViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/7/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V2ImageView.h"
@interface MenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet V2ImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) NSArray *labelArray;
@end
