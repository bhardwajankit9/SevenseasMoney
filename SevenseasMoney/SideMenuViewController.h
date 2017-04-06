//
//  SideMenuViewController.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/4/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V2ImageView.h"

@interface SideMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet V2ImageView *profileImage;


@property (weak, nonatomic) IBOutlet UITableView *sideMenuTableView;

@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) NSArray *labelArray;
@end
