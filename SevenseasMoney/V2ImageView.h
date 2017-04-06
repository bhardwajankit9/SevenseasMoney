//
//  V2ImageView.h
//  V2CompomentsInternal
//
//  Created by Sachin Amrale on 6/27/16.
//  Copyright © 2016 V2Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, V2ImageStyle) {
    V2ImageStyleHexagon,
    V2ImageStylePentagon,
    V2ImageStyleSquare,
    V2ImageStyleCircle,
    V2ImageStyleDiamond,
    V2ImageStyleDefault
};

typedef NS_ENUM(NSUInteger, V2ImageBorderColor) {
    V2BorderRed,
    V2BorderWhite,
    V2BorderGray,
    V2BorderDefault
};

@protocol V2ImageViewDelegate <NSObject>

@optional
-(void)imageClicked;

@end


@interface V2ImageView : UIView


@property (nonatomic, weak) id <V2ImageViewDelegate> delegate;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIBezierPath *bezierPath;
@property (nonatomic,strong) UIColor *lineColor;
@property (nonatomic) float sideCount;

-(void)setBorderColor :(V2ImageBorderColor )borderColor;
-(void)setImage:(UIImage*)image;
-(void)changeImageClicked;
-(void)setImageStyle : (V2ImageStyle )imageStyle;

@end
