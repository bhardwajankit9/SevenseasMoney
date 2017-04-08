//
//  PaidCell.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/8/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "PaidCell.h"

@implementation PaidCell

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    
//    if (self) {
//        [self addObserver:self forKeyPath:@"paidView" options:NSKeyValueObservingOptionInitial context:NULL];
//        [self addObserver:self forKeyPath:@"contentView" options:NSKeyValueObservingOptionInitial context:NULL];
//        _paidView.layer.masksToBounds = YES;
//    }
//    return self;
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"paidView"]) {
//        self.paidView.backgroundColor = [UIColor whiteColor];
//        _paidView.layer.cornerRadius = 10;
//        _paidView.layer.masksToBounds = YES;
//        self.paidView.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.6] CGColor];
//        self.paidView.layer.borderWidth = 2;
//        
//    } else if ([keyPath isEqualToString:@"contentView"]) {
//        self.contentView.backgroundColor = kCellBackgroundColor;
//    }
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
