//
//  TKTextField.h
//  TykoonActiveStack
//
//  Created by aanchal on 25/05/16.
//  Copyright © 2016 V2Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPFloatingPlaceholderConstants.h"

typedef NS_ENUM(NSUInteger,V2TextFieldStatus){
    V2TextFieldStatusDefault,
    V2TextFieldStatusError
};

typedef NS_ENUM(NSUInteger, TKTextFieldStyle) {
    TKTextFieldStyleDefault,
    TKTextFieldStyleUserName,
    TKTextFieldStylePassword,
    TKTextFieldStyleEmailId,
    TKTextFieldStyleDOB,
    TKTextFieldStyleDOBGray,
    TKTextFieldStyleDollarWhite,
    TKTextFieldStyleDollarGray,
    TKTextFieldStyleBottomStyleWithDarkGray,
    TKTextFieldWithPickerView,
    TKTextFieldWithWhiteDropDown,
    TKTextFieldDescription,
    TKTextFieldChildName,
    TKTextFieldStyleNewPassword,
    TKTextFieldStyleCurrentPassword,
    TKTextFieldStylePicker,
};

typedef NS_ENUM(NSUInteger, TKTextFieldBorder) {
    Left,
    Right,
    Top,
    Bottom,
    All
};

@interface TKTextField : UITextField<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIDatePicker *datePickerView;
    NSUInteger selectPickerRow;
    UIPickerView *pickerView;
}
@property (nonatomic) RPFloatingPlaceholderAnimationOptions animationDirection;
@property (nonatomic, strong, readonly) UILabel *floatingLabel;
@property (nonatomic, strong) UIColor *floatingLabelActiveTextColor;
@property (nonatomic, strong) UIColor *floatingLabelInactiveTextColor;
@property (nonatomic, strong) UIColor *defaultPlaceholderColor;

@property (nonatomic, assign) V2TextFieldStatus status;

@property(nonatomic,assign) NSString *textFieldStyle;
@property(nonatomic,assign) TKTextFieldStyle style;
@property(nonatomic,assign) CGFloat rightPadding;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableArray *reportsDetailsArray;
@property (nonatomic, strong) NSString *tempString;
@property (nonatomic, copy) NSArray* borderColors;

-(void)setTextFieldStyle:(TKTextFieldStyle )style withFontSize:(CGFloat)fontSize withBorderColor:(UIColor *) withBorderColor;

@end
