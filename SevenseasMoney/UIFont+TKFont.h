//
//  UIFont+TKFont.h
//  TykoonActiveStack
//
//  Created by aanchal on 25/05/16.
//  Copyright © 2016 V2Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (TKFont)

+ (UIFont *)TKTykoonTitleFont;
+ (UIFont *)TKForgotPasswordLabelFont;
+ (UIFont *)TKApplicationFontRegularWithSize:(CGFloat)size;
+ (UIFont *)TKTykoonTitleFontForName;
+ (UIFont *)TKTykoonTitleFontForAmount;
+ (UIFont *)TKTableViewCellDescriptionLabelFont;
+ (UIFont *)TKTableViewCellAmountLabelFont;
+ (UIFont *)TKMessageLabelFont;
+ (UIFont *)TKStatusLabelFont;
+ (UIFont *)TKDateLabelFont;
+ (UIFont *)TKTykoonTransactionAndProposalsFont;
+ (UIFont *)TKTykoonNavigationBarTitleFont;
+ (UIFont *)TKSubtitleFont;

@end
