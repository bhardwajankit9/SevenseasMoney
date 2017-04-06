//
//  WalletTableViewCell.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/3/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "WalletTableViewCell.h"

@implementation WalletTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    _borderView.layer.cornerRadius = 10;

    if (self) {
       // self.imagesPlaceHolderWidth = NSIntegerMin;
        [self addObserver:self forKeyPath:@"borderView" options:NSKeyValueObservingOptionInitial context:NULL];
        [self addObserver:self forKeyPath:@"contentView" options:NSKeyValueObservingOptionInitial context:NULL];
                _borderView.layer.masksToBounds = YES;
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"border"]) {
        self.borderView.backgroundColor = [UIColor whiteColor];
        _borderView.layer.cornerRadius = 10;
        //_borderView.layer.masksToBounds = YES;
        self.borderView.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.6] CGColor];
        self.borderView.layer.borderWidth = 2;

      
    } else if ([keyPath isEqualToString:@"contentView"]) {
        self.contentView.backgroundColor = kCellBackgroundColor;
    }
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
