//
//  WalletTableViewCell.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/3/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCellBackgroundColor [[UIColor lightGrayColor] colorWithAlphaComponent:0.5]

@interface WalletTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *borderView;

@end
