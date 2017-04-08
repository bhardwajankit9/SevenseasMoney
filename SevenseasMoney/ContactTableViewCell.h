//
//  ContactTableViewCell.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/6/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V2ImageView.h"
@interface ContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *contactImage;
@property (weak, nonatomic) IBOutlet V2ImageView *contactView;

@end
