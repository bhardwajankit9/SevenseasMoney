//
//  AddedCell.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/8/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "AddedCell.h"

@implementation AddedCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self addObserver:self forKeyPath:@"addedVeiw" options:NSKeyValueObservingOptionInitial context:NULL];
        [self addObserver:self forKeyPath:@"contentView" options:NSKeyValueObservingOptionInitial context:NULL];
        self.addedVeiw.layer.masksToBounds = YES;
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"addedVeiw"]) {
       self.addedVeiw.backgroundColor = [UIColor whiteColor];
        self.addedVeiw.layer.cornerRadius = 10;
        self.addedVeiw.layer.masksToBounds = YES;
        self.addedVeiw.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.6] CGColor];
        self.addedVeiw.layer.borderWidth = 2;
        
        
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
