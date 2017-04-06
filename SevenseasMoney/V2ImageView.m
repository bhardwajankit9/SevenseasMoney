//
//  V2ImageView.m
//  V2CompomentsInternal
//
//  Created by Sachin Amrale on 6/27/16.
//  Copyright © 2016 V2Solutions. All rights reserved.
//

#import "V2ImageView.h"
#import <QuartzCore/QuartzCore.h>

#define LineWidth 1.5
#define insetW 2
#define inserH 2

@implementation V2ImageView

- (instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        [self commonInit];
    }
    return self;
}

-(void)commonInit
{
    self.translatesAutoresizingMaskIntoConstraints = false;
    self.bezierPath = [[UIBezierPath alloc]init];
    self.lineColor = [UIColor lightGrayColor];
    self.backgroundColor = [UIColor clearColor];
    self.imageView = [[UIImageView alloc]init];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
    UITapGestureRecognizer *tapGestureRocognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeImageClicked)];
    self.imageView.userInteractionEnabled = true;
    [self.imageView addGestureRecognizer:tapGestureRocognizer] ;
    [self addSubview:self.imageView];
    [self setBorderColor:V2BorderDefault];
    
}

-(void)drawRect:(CGRect)rect
{
    UIBezierPath *path = self.bezierPath;
    if(path){
        [self.lineColor setStroke];
        [path stroke];
    }
}

-(void)setImage:(UIImage*)image{
    
    self.imageView.image = image;
}

-(void)setBorderColor :(V2ImageBorderColor )borderColor
{
    switch (borderColor) {
        case V2BorderGray:
            self.lineColor = [UIColor grayColor];
            break;
            
        case V2BorderWhite:
            self.lineColor = [UIColor whiteColor];
            break;
            
        case V2BorderRed:
            self.lineColor = [UIColor redColor];
            break;
            
        default:
            self.lineColor = [UIColor lightGrayColor];
            break;
    }
}

-(void)changeImageClicked
{
    [self.delegate imageClicked];
}


-(void)setImageStyle : (V2ImageStyle )imageStyle
{
    switch (imageStyle) {
        case V2ImageStyleHexagon:
            self.sideCount = 6;
            [self drawImageShapewithStyle:imageStyle];
            break;
            
        case V2ImageStyleDiamond:
            self.sideCount = 4;
            [self drawImageShapewithStyle:imageStyle];
            break;
            
        case V2ImageStylePentagon:
            self.sideCount = 5;
            [self drawImageShapewithStyle:imageStyle];
            break;
        case V2ImageStyleSquare:
            self.sideCount = 4;
            [self drawImageShapewithStyle:imageStyle];
            break;
        case V2ImageStyleCircle:
            [self drawImageShapewithStyle:imageStyle];
            break;
        default:
            break;
    }
}

-(void)drawImageShapewithStyle:(V2ImageStyle )style
{
    //[super layoutSubviews];
    CGRect rect = self.bounds;
    CGRect insetRect = CGRectInset(rect, insetW, inserH);
    CGFloat radius = (insetRect.size.width > insetRect.size.height ? insetRect.size.height : insetRect.size.width) / 2.0;
    CGPoint center = CGPointMake(CGRectGetMidX(insetRect), CGRectGetMidY(insetRect));
    CGFloat radian = (M_PI * 2) / (self.sideCount);
    CGFloat subRadius = radius * 0.4;
    UIBezierPath *path = self.bezierPath;
    path.lineWidth = LineWidth;
    CGPoint startPoint = CGPointMake(center.x, center.y - radius);
    [path moveToPoint:startPoint];
    
    if(style == V2ImageStyleCircle){
        [path addArcWithCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    }
    if(style == V2ImageStyleSquare){

        [path moveToPoint:CGPointMake(LineWidth, LineWidth)];
        [path addLineToPoint:CGPointMake(self.frame.size.width-LineWidth, LineWidth)];
        [path addLineToPoint:CGPointMake(self.frame.size.width-LineWidth, self.frame.size.width-LineWidth)];
        [path addLineToPoint:CGPointMake(LineWidth, self.frame.size.width)];
        [path closePath];
        
    }
    else
    {
        //first curve
        CGPoint firstControlPoint = CGPointMake(startPoint.x, startPoint.y + subRadius);
        [path addArcWithCenter:firstControlPoint radius:subRadius startAngle:(3 * M_PI_2) endAngle:((3 * M_PI_2) - radian/2) clockwise:false];
    
        for(int i=1;i<=self.sideCount;i++)
        {
            CGFloat angle = (3*M_PI/2) - (CGFloat)i*radian;
            CGPoint point = CGPointMake(center.x + radius * cos(angle), center.y + radius * sin(angle));
            CGPoint controlPoint = CGPointMake(center.x + (radius*0.6) * cos(angle), center.y + (radius*0.6) * sin(angle));
            CGFloat deltaY = point.y - controlPoint.y;
            CGFloat deltaX = point.x - controlPoint.x;
            CGFloat radianDelta = atan2(deltaY, deltaX);
            CGFloat startAngle = radianDelta + (radian/2);
            CGFloat endAngle = radianDelta - (radian/2);
            [path addArcWithCenter:controlPoint radius:subRadius startAngle:startAngle endAngle:endAngle clockwise:false];
        }
    }
    
    self.imageView.frame = self.bounds;
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.path = path.CGPath;
    self.imageView.layer.mask = maskLayer;
    self.bezierPath = path;
    [self setNeedsDisplay];
    
}


@end
