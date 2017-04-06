//
//  UIFont+TKFont.m
//  TykoonActiveStack
//
//  Created by aanchal on 25/05/16.
//  Copyright © 2016 V2Solutions. All rights reserved.
//


#import "UIFont+TKFont.h"

@implementation UIFont (TKFont)


+ (UIFont *)TKTykoonTitleFont
{
    return [UIFont fontWithName:@"Quicksand-Bold" size:20];
}

+ (UIFont *)TKForgotPasswordLabelFont
{
    return [UIFont fontWithName:@"Quicksand-Regular" size:16];
}

+(UIFont *)TKApplicationFontRegularWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Quicksand-Regular" size:size];
}

+ (UIFont *)TKTykoonTitleFontForName
{
    return [UIFont fontWithName:@"Quicksand-Bold" size:18];
}

+ (UIFont *)TKTykoonTitleFontForAmount
{
    return [UIFont fontWithName:@"Quicksand-Bold" size:22];
}

+ (UIFont *)TKTableViewCellDescriptionLabelFont
{
    return [UIFont fontWithName:@"Quicksand-Regular" size:16];
}

+ (UIFont *)TKTableViewCellAmountLabelFont
{
    return [UIFont fontWithName:@"Quicksand-Bold" size:18];
}

+ (UIFont *)TKMessageLabelFont
{
    return [UIFont fontWithName:@"Quicksand-Regular" size:14];
}

+ (UIFont *)TKStatusLabelFont
{
    return [UIFont fontWithName:@"Quicksand-Regular" size:12];
}

+ (UIFont *)TKDateLabelFont
{
    return [UIFont fontWithName:@"Quicksand-Regular" size:10];
}

+ (UIFont *)TKTykoonTransactionAndProposalsFont
{
    return [UIFont fontWithName:@"Quicksand-Bold" size:17];
}

+ (UIFont *)TKTykoonNavigationBarTitleFont
{
    return [UIFont fontWithName:@"Quicksand-Bold" size:17];
}

+ (UIFont *)TKSubtitleFont
{
    return [UIFont fontWithName:@"Quicksand-Bold" size:16];
}


@end
