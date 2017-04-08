//
//  ReceiveCell.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/8/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "ReceiveCell.h"

@implementation ReceiveCell

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    
//    if (self) {
//        // self.imagesPlaceHolderWidth = NSIntegerMin;
//        [self addObserver:self forKeyPath:@"receivedView" options:NSKeyValueObservingOptionInitial context:NULL];
//        [self addObserver:self forKeyPath:@"contentView" options:NSKeyValueObservingOptionInitial context:NULL];
//        self.receivedView.layer.masksToBounds = YES;
//    }
//    return self;
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"receivedView"]) {
//        self.receivedView.backgroundColor = [UIColor whiteColor];
//        self.receivedView.layer.cornerRadius = 10;
//         self.receivedView.layer.masksToBounds = YES;
//        self.receivedView.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0.6] CGColor];
//        self.receivedView.layer.borderWidth = 2;
//        
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
