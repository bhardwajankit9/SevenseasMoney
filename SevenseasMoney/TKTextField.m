//
//  TKTextField.m
//  TykoonActiveStack
//
//  Created by aanchal on 25/05/16.
//  Copyright © 2016 V2Solutions. All rights reserved.
//

#import "TKTextField.h"
//#import "UIFont+TKFont.h"

#define kEyeIcon @"password_eyeIcon"
#define kGrayCalenderIcon @"calanderIcon"
#define kWhiteCalenderIcon @"childEditTransactionCalendar"
#define kWhiteDollarImage @"dollarIconWhite"
#define kGrayDollarImage @"dollarIconGray"
#define kDownArrowGray @"downArrowGrey"
#define kDownArrowWhite @"downArrowWhite"
#define kEyeIconDark @"changePasswordDark"

@interface TKTextField ()

@property (nonatomic, strong) NSString *cachedPlaceholder;
@property (nonatomic, assign) BOOL shouldDrawPlaceholder;
@property (nonatomic, assign) CGRect originalTextFieldFrame;
@property (nonatomic, assign) CGRect offsetTextFieldFrame;
@property (nonatomic, assign) CGRect originalFloatingLabelFrame;
@property (nonatomic, assign) CGRect offsetFloatingLabelFrame;
@property (nonatomic, strong, readwrite) UILabel *floatingLabel;

@end

@implementation TKTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Setup the view defaults
        [self setupViewDefaults];
        [self setupDefaultColorStates];
    }
    return self;
}


- (void)commonInit
{
    if(self)
    {
        self.delegate = self;
        selectPickerRow = 0;
        datePickerView = [[UIDatePicker alloc]init];
        self.array = [[NSMutableArray alloc]initWithObjects:@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday", nil];
        self.reportsDetailsArray = [[NSMutableArray alloc]initWithObjects:@"All Transactions", @"Earning" ,@"Spending", nil];
        self.borderColors = @[[UIColor redColor],[UIColor blackColor]];
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if(self){
        [self commonInit];
        [self setupViewDefaults];

    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // This must be done in awakeFromNib since global tint color isn't set by the time initWithCoder: is called
    [self setupDefaultColorStates];
    
    // Ensures that the placeholder & text are set through our custom setters
    // when loaded from a nib/storyboard.
    self.placeholder = self.placeholder;
    self.text = self.text;
}

- (id)initWithStatus:(V2TextFieldStatus)status
{
    self = [super init];
    if (self) {
        [self commonInit];
        [self setStatus:status];
    }
    return self;
}

- (void) setStatus:(V2TextFieldStatus)status{
    _status = status;
    [self updateSelf];
}

- (void) updateSelf
{
    self.layer.borderColor = [self.borderColors[self.status] CGColor];
    [self.layer layoutIfNeeded];
    [self.layer setMasksToBounds:true];
    
    
}

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)inIt {
    [NSException raise:NSInvalidArgumentException format:@"%s Using the %@ initializer directly is not supported. Use %@ instead.", __PRETTY_FUNCTION__, NSStringFromSelector(@selector(init)), NSStringFromSelector(@selector(initWithFrame:))];
    return nil;
}

- (void)dealloc
{
    // Remove the text view observers
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textFieldTextDidChange:nil];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment: textAlignment];
    self.floatingLabel.textAlignment = textAlignment;
}

- (void)setPlaceholder:(NSString *)aPlaceholder
{
    if ([self.cachedPlaceholder isEqualToString:aPlaceholder]) return;
    
    // We draw the placeholder ourselves so we can control when it is shown
    // during the animations
    [super setPlaceholder:nil];
    
    self.cachedPlaceholder = aPlaceholder;
    
    self.floatingLabel.text = self.cachedPlaceholder;
    [self adjustFramesForNewPlaceholder];
    
    // Flags the view to redraw
    [self setNeedsDisplay];
}

- (void)setFloatingLabelActiveTextColor:(UIColor *)floatingLabelActiveTextColor
{
    _floatingLabelActiveTextColor = floatingLabelActiveTextColor;
    if (self.isEditing)
        self.floatingLabel.textColor = floatingLabelActiveTextColor;
}

- (BOOL)hasText
{
    return self.text.length != 0;
}

- (void)setupViewDefaults
{
    // Add observers for the text field state changes
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidBeginEditing:)
                                                 name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidEndEditing:)
                                                 name:UITextFieldTextDidEndEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:)
                                                 name:UITextFieldTextDidChangeNotification object:self];
    
    // Forces drawRect to be called when the bounds change
    self.contentMode = UIViewContentModeRedraw;
    
    // Set the default animation direction
    self.animationDirection = RPFloatingPlaceholderAnimateUpward;
    
    // Create the floating label instance and add it to the view
    self.floatingLabel = [[UILabel alloc] init];
    self.floatingLabel.font = [UIFont boldSystemFontOfSize:11.f];
    self.floatingLabel.textAlignment = self.textAlignment;
    self.floatingLabel.backgroundColor = [UIColor clearColor];
    self.floatingLabel.alpha = 1.f;
    
    // Adjust the top margin of the text field and then cache the original
    // view frame
    self.originalTextFieldFrame = UIEdgeInsetsInsetRect(self.frame, UIEdgeInsetsMake(5.f, 0.f, 2.f, 0.f));
    self.frame = self.originalTextFieldFrame;
    
    // Set the background to a clear color
    self.backgroundColor = [UIColor clearColor];
}

- (void)setupDefaultColorStates {
    // Setup default colors for the floating label states
    UIColor *defaultActiveColor;
    if ([self respondsToSelector:@selector(tintColor)]) {
        defaultActiveColor = self.tintColor ?: [[[UIApplication sharedApplication] delegate] window].tintColor;
    } else {
        // iOS 6
        defaultActiveColor = [UIColor blueColor];
    }
    self.floatingLabelActiveTextColor = self.floatingLabelActiveTextColor ?: defaultActiveColor;
    self.floatingLabelInactiveTextColor = self.floatingLabelInactiveTextColor ?: [UIColor colorWithWhite:0.7f alpha:1.f];
    
    self.floatingLabel.textColor = self.floatingLabelActiveTextColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Check if we need to redraw for pre-existing text
    if (![self isFirstResponder]) {
        [self checkForExistingText];
    }
}

- (void)drawRect:(CGRect)aRect
{
    [super drawRect:aRect];
    
    // Check if we should draw the placeholder string.
    // Use RGB values found via Photoshop for placeholder color #c7c7cd.
    if (self.shouldDrawPlaceholder) {
        UIColor *placeholderGray = self.defaultPlaceholderColor ?: [UIColor colorWithRed:199/255.f green:199/255.f blue:205/255.f alpha:1.f];
        // Inset the placeholder by the same 5px on both sides so that it works in right-to-left languages too
        CGRect placeholderFrame = CGRectMake(5.f, floorf((self.frame.size.height - self.font.lineHeight) / 2.f), self.frame.size.width - 10, self.frame.size.height);
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setAlignment: self.textAlignment];
        
        NSDictionary *placeholderAttributes = @{NSFontAttributeName : self.font,
                                                NSForegroundColorAttributeName : placeholderGray,
                                                NSParagraphStyleAttributeName : paragraphStyle};
        
        if ([self respondsToSelector:@selector(tintColor)]) {
            [self.cachedPlaceholder drawInRect:placeholderFrame
                                withAttributes:placeholderAttributes];
            
        } else {
            NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.cachedPlaceholder
                                                                                        attributes:placeholderAttributes];
            [attributedPlaceholder drawInRect:placeholderFrame];
        } // iOS 6
        
    }
}

- (void)didMoveToSuperview
{
    if (self.floatingLabel.superview != self.superview) {
        if (self.superview && self.hasText) {
            [self.superview addSubview:self.floatingLabel];
        } else {
            [self.floatingLabel removeFromSuperview];
        }
    }
}

- (void)showFloatingLabelWithAnimation:(BOOL)isAnimated
{
    // Add it to the superview
    if (self.floatingLabel.superview != self.superview) {
        [self.superview addSubview:self.floatingLabel];
    }
    
    // Flags the view to redraw
    [self setNeedsDisplay];
    
    if (isAnimated) {
        UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseOut;
        [UIView animateWithDuration:0.2f delay:0.f options:options animations:^{
            self.floatingLabel.alpha = 1.f;
            if (self.animationDirection == RPFloatingPlaceholderAnimateDownward) {
                self.frame = self.offsetTextFieldFrame;
            } else {
                self.floatingLabel.frame = self.offsetFloatingLabelFrame;
            }
        } completion:nil];
    } else {
        self.floatingLabel.alpha = 1.f;
        if (self.animationDirection == RPFloatingPlaceholderAnimateDownward) {
            self.frame = self.offsetTextFieldFrame;
        } else {
            self.floatingLabel.frame = self.offsetFloatingLabelFrame;
        }
    }
}

- (void)hideFloatingLabel
{
    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseIn;
    [UIView animateWithDuration:0.2f delay:0.f options:options animations:^{
        self.floatingLabel.alpha = 0.f;
        if (self.animationDirection == RPFloatingPlaceholderAnimateDownward) {
            self.frame = self.originalTextFieldFrame;
        } else {
            self.floatingLabel.frame = self.originalFloatingLabelFrame;
        }
    } completion:^(BOOL finished) {
        // Flags the view to redraw
        [self setNeedsDisplay];
    }];
}

- (void)checkForExistingText
{
    // Check if we need to redraw for pre-existing text
    self.shouldDrawPlaceholder = !self.hasText;
    if (self.hasText) {
        self.floatingLabel.textColor = self.floatingLabelInactiveTextColor;
        [self showFloatingLabelWithAnimation:NO];
    }
}

- (void)adjustFramesForNewPlaceholder
{
    [self.floatingLabel sizeToFit];
    
    CGFloat offset = ceil(self.floatingLabel.font.lineHeight);
    
    self.originalFloatingLabelFrame = CGRectMake(self.originalTextFieldFrame.origin.x + 5.f, self.originalTextFieldFrame.origin.y,
                                                 self.originalTextFieldFrame.size.width - 10.f, self.floatingLabel.frame.size.height);
    self.floatingLabel.frame = self.originalFloatingLabelFrame;
    
    self.offsetFloatingLabelFrame = CGRectMake(self.originalFloatingLabelFrame.origin.x, self.originalFloatingLabelFrame.origin.y - offset,
                                               self.originalFloatingLabelFrame.size.width, self.originalFloatingLabelFrame.size.height);
    
    self.offsetTextFieldFrame = CGRectMake(self.originalTextFieldFrame.origin.x, self.originalTextFieldFrame.origin.y + offset,
                                           self.originalTextFieldFrame.size.width, self.originalTextFieldFrame.size.height);
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0.f, 5.f, 0.f, 5.f))];
}

// Adds padding so these text fields align with RPFloatingPlaceholderTextView's
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return [super editingRectForBounds:UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0.f, 5.f, 0.f, 5.f))];
}

- (void)animateFloatingLabelColorChangeWithAnimationBlock:(void (^)(void))animationBlock
{
    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionTransitionCrossDissolve;
    [UIView transitionWithView:self.floatingLabel duration:0.25 options:options animations:^{
        animationBlock();
    } completion:nil];
}



-(void)setTextFieldStyle:(TKTextFieldStyle )style withFontSize:(CGFloat)fontSize withBorderColor:(UIColor *) withBorderColor
{
    self.style = style;
    switch (style) {
        case TKTextFieldStyleDefault:
            
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleDefault";
            self.keyboardType = UIKeyboardTypeDefault;
            break;
            
        case TKTextFieldStylePassword:
            
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStylePassword";
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            [self setupHideShowPasswordButton];
            self.keyboardType = UIKeyboardTypeDefault;
            self.secureTextEntry = true;
            
            break;
            
        case TKTextFieldStyleUserName:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleUserName";
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            self.keyboardType = UIKeyboardTypeDefault;
            break;

        case TKTextFieldStyleEmailId:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleEmailId";
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            self.keyboardType = UIKeyboardTypeEmailAddress;
            break;
            
        case TKTextFieldStyleDOB:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleDOB";
            [self setUpDOBtextField];
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            break;
            
        case TKTextFieldStyleDOBGray:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleDOBGray";
            [self setupDOBGraytextField];
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            break;
            
        case TKTextFieldStyleDollarWhite:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleDollarWhite";
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            [self appendDollarImageWhiteToTextField];
            self.keyboardType = UIKeyboardTypeDecimalPad;
            break;
            
        case TKTextFieldStyleDollarGray:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleDollarGray";
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            [self appendDollarImageGrayToTextField];
            self.keyboardType = UIKeyboardTypeDecimalPad;
            break;
            
        case TKTextFieldStyleBottomStyleWithDarkGray:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldStyleBottomStyleWithDarkGray";
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            break;
            
        case TKTextFieldWithPickerView:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldWithPickerView";
            [self appendDownArrowImageToTextField];
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            break;
            
        case TKTextFieldWithWhiteDropDown:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldWithWhiteDropDown";
            [self appendDownArrowImageToTextField];
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            break;
            
        case TKTextFieldDescription:
            self.delegate = self;
            self.textFieldStyle = @"TKTextFieldDescription";
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth:2.0];
            self.keyboardType = UIKeyboardTypeDefault;
            break;
            
        case TKTextFieldChildName:
            self.textFieldStyle = @"TKTextFieldChildName";
            [self appendDownArrowImageToTextField];
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth: 2.0];
            break;
            
        case TKTextFieldStyleNewPassword:
            self.textFieldStyle = @"TKTextFieldStyleNewPassword";
            self.secureTextEntry = true;
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth: 2.0];
            [self setupHideShowPasswordButtonDark];
            self.keyboardType = UIKeyboardTypeDefault;
            break;
            
        case TKTextFieldStyleCurrentPassword:
            self.textFieldStyle = @"TKTextFieldStyleCurrentPassword";
            self.secureTextEntry = true;
            [self setBorderToTextField:Bottom withBorderColor:withBorderColor withBorderWidth: 2.0];
            self.keyboardType = UIKeyboardTypeDefault;
            break;
            
        default:
            break;
    }
    
    //self.font = [UIFont TKApplicationFontRegularWithSize:fontSize];
}

-(void)appendDownArrowImageToTextField {
    
    NSString *imageName;
    
    if([self.textFieldStyle isEqualToString:@"TKTextFieldWithPickerView"]){
        imageName = kDownArrowGray;
    }
    else{
        imageName = kDownArrowWhite;
    }
    
    UIImage *downArrow = [UIImage imageNamed:imageName];
    UIImageView *downArrowImageView = [[UIImageView alloc] initWithImage:downArrow];
    self.rightView = downArrowImageView;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightPadding = 50;
}

#pragma mark - Methods for adding DollarImage

-(void)appendDollarImageWhiteToTextField {
    UIImage *dollarImage = [UIImage imageNamed:kWhiteDollarImage];
    UIImageView *dollarImageView = [[UIImageView alloc]initWithImage:dollarImage];
    self.leftView = dollarImageView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void)appendDollarImageGrayToTextField {
    UIImage *dollarImage = [UIImage imageNamed:kGrayDollarImage];
    UIImageView *dollarImageView = [[UIImageView alloc]initWithImage:dollarImage];
    self.leftView = dollarImageView;
    self.leftViewMode = UITextFieldViewModeAlways;
}


#pragma mark - Border method for adding border to textfield

-(void)setBorderToTextField:(TKTextFieldBorder )vBorder withBorderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth {
    
    CALayer *border = [[CALayer alloc]init];
    
    switch (vBorder) {
        case Left:
            border.backgroundColor = borderColor.CGColor;
            border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
            break;
            
        case Right:
            border.backgroundColor = borderColor.CGColor;
            border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
            break;
            
        case Top:
            border.backgroundColor = borderColor.CGColor;
            border.frame = CGRectMake(0, 0, self.frame.size.width,borderWidth);
            break;
            
        case Bottom:
            border.backgroundColor = borderColor.CGColor;
            border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width - self.rightPadding,borderWidth);
            break;
            
        case All:
            self.layer.borderWidth = borderWidth;
            self.layer.borderColor = borderColor.CGColor;
            break;
            
        default:
            break;
    }
    
    [self.layer addSublayer:border];
}

#pragma mark - Hide/Show password button

-(void)setupHideShowPasswordButton {
    UIButton *showHIdePasswordButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [showHIdePasswordButton setImage:[UIImage imageNamed:kEyeIcon] forState:UIControlStateNormal];
    [showHIdePasswordButton addTarget:self action:@selector(hideShowPasswordButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.rightView = showHIdePasswordButton;
    self.rightViewMode = UITextFieldViewModeAlways;
}

-(void)hideShowPasswordButtonClicked:(id)sender {
    if(self.secureTextEntry){
        self.secureTextEntry = false;
        NSString *pwd = self.text;
        self.attributedText = [[NSAttributedString alloc]initWithString:pwd];
    }else{
        self.secureTextEntry = true;
    }
}

-(void)setupHideShowPasswordButtonDark {
    UIButton *showHIdePasswordButtonDark = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [showHIdePasswordButtonDark setImage:[UIImage imageNamed:kEyeIconDark] forState:UIControlStateNormal];
    [showHIdePasswordButtonDark addTarget:self action:@selector(hideShowPasswordButtonDarkClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.rightView = showHIdePasswordButtonDark;
    self.rightViewMode = UITextFieldViewModeAlways;
}

-(void)hideShowPasswordButtonDarkClicked:(id)sender {
    if(self.secureTextEntry){
        self.secureTextEntry = false;
        NSString *pwd = self.text;
        self.attributedText = [[NSAttributedString alloc]initWithString:pwd];
    }else{
        self.secureTextEntry = true;
    }
}


#pragma mark - calender textField setup and action

-(void)setUpDOBtextField {
    UIImage *calenderImage = [UIImage imageNamed:kWhiteCalenderIcon];
    UIImageView *calenderImageView = [[UIImageView alloc]initWithImage:calenderImage];
    self.rightView = calenderImageView;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightPadding = 50;
}

-(void)setupDOBGraytextField {
    UIImage *calenderImage = [UIImage imageNamed:kGrayCalenderIcon];
    UIImageView *calenderImageView = [[UIImageView alloc]initWithImage:calenderImage];
    self.rightView = calenderImageView;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightPadding = 50;
}

#pragma mark - adding UIDatePicker method

-(void)addButtonToPickerTextField
{
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.barStyle = UIBarStyleDefault;
    [toolBar sizeToFit];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(donePicker)];
    UIBarButtonItem *spaceButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelPicker)];
    
    [toolBar setItems:@[cancelButton,spaceButton,doneButton] animated:false];
    toolBar.userInteractionEnabled = true;
    self.inputView = datePickerView;
    self.inputAccessoryView = toolBar;
    
}


-(void)addPickerToTextField
{
    pickerView = [[UIPickerView alloc]init];
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = true;
    pickerView.dataSource = self;
    
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.barStyle = UIBarStyleDefault;
    [toolBar sizeToFit];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPicker)];
    UIBarButtonItem *spaceButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelPicker)];
    
    [toolBar setItems:@[cancelButton,spaceButton,doneButton] animated:false];
    toolBar.userInteractionEnabled = true;
    self.inputView = pickerView;
    self.inputAccessoryView = toolBar;
    
}


-(void)doneButtonPicker{

  NSUInteger num = [[pickerView dataSource] numberOfComponentsInPickerView:pickerView];
  NSMutableString *text = [NSMutableString string];
  for(NSUInteger i =0;i<num;++i)
  {
    NSUInteger selectRow = [pickerView selectedRowInComponent:i];
    NSString *ww = [[pickerView delegate] pickerView:pickerView titleForRow:selectRow forComponent:i];
    [text appendFormat:@"%@",ww];
    self.text = text;
  }
  
  [self resignFirstResponder];
}

-(void)donePicker{
   NSDate *myDate = datePickerView.date;
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
  [dateFormatter setDateFormat:@"MM-dd-yyyy"];
  NSDate *date = myDate;
  self.text = [dateFormatter stringFromDate:date];
  
  
    [self resignFirstResponder];
}

-(void)cancelPicker{
  self.text = self.tempString;
    [self resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if([self.textFieldStyle isEqualToString:@"TKTextFieldWithPickerView"]){
        return [self.array count];
    }
    else{
        return [self.reportsDetailsArray count];
    }
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:   (NSInteger)component{
    
    if([self.textFieldStyle isEqualToString:@"TKTextFieldWithPickerView"]){
        return [self.array objectAtIndex:row];
    }
    else{
        return [self.reportsDetailsArray objectAtIndex:row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if([self.textFieldStyle isEqualToString:@"TKTextFieldWithPickerView"]){
        self.text = [self.array objectAtIndex:row];
    }
    else{
        self.text = [self.reportsDetailsArray objectAtIndex:row];
    }
}


-(void)addDatePickerToTextField
{
    self.tempString = self.text;
    datePickerView.datePickerMode = UIDatePickerModeDate;
    datePickerView.maximumDate = [NSDate date];
    self.inputView = datePickerView;
    [datePickerView addTarget:self action:@selector(handleDatePicker:) forControlEvents:UIControlEventValueChanged];
}

-(void)handleDatePicker:(id)sender
{
  self.tempString = self.text;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    NSDate *date = [(UIDatePicker *)sender date];
    self.text = [dateFormatter stringFromDate:date];
}


#pragma mark - TKTextDield delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self resignFirstResponder];
    return true;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    __weak __typeof(self) weakSelf = self;
//    [self animateFloatingLabelColorChangeWithAnimationBlock:^{
//        __strong __typeof(weakSelf) strongSelf = weakSelf;
//        _floatingLabel.textColor = strongSelf.floatingLabelActiveTextColor;
//    }];

    switch (self.style) {
        case TKTextFieldStyleDefault:
            break;
        case TKTextFieldStylePassword:
            break;
        case TKTextFieldStyleUserName:
            break;
        case TKTextFieldStyleEmailId:
            break;
        case TKTextFieldStyleDollarWhite:
            break;
        case TKTextFieldStyleDollarGray:
            break;
        case TKTextFieldStyleDOB:
            [self addDatePickerToTextField];
            [self addButtonToPickerTextField];
            break;
        case TKTextFieldStyleDOBGray:
            [self addDatePickerToTextField];
            [self addButtonToPickerTextField];
            break;
        case TKTextFieldWithWhiteDropDown:
            [self addPickerToTextField];
            break;
        case TKTextFieldWithPickerView:
            [self addPickerToTextField];
            break;
        default:
            break;
    }
    return true;
}

- (void)textFieldDidBeginEditing:(NSNotification *)notification
{
    __weak __typeof(self) weakSelf = self;
    [self animateFloatingLabelColorChangeWithAnimationBlock:^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        _floatingLabel.textColor = strongSelf.floatingLabelActiveTextColor;
    }];
}


- (void)textFieldDidEndEditing:(NSNotification *)notification
{
    __weak __typeof(self) weakSelf = self;
    [self animateFloatingLabelColorChangeWithAnimationBlock:^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        self.floatingLabel.textColor = strongSelf.floatingLabelInactiveTextColor;
    }];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    switch (self.style) {
        case TKTextFieldStyleDefault:
            break;
        case TKTextFieldStylePassword:{
            NSString *pwd = self.text;
            self.attributedText = [[NSAttributedString alloc]initWithString:pwd];
            }
            break;
        case TKTextFieldStyleUserName:
            break;
        case TKTextFieldStyleEmailId:
            break;
        case TKTextFieldStyleDOB:
            break;
        case TKTextFieldStyleDOBGray:
            break;
        case TKTextFieldStyleBottomStyleWithDarkGray:
            break;
        case TKTextFieldWithPickerView:
            break;
        case TKTextFieldWithWhiteDropDown:
            break;
        case TKTextFieldStyleDollarWhite:{
            NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            NSString *pattern = @"^([0-9]{1,3}+)?(\\.([0-9]{1,2})?)?$";
            NSError *error = nil;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
            NSRange textRange = NSMakeRange(0, string.length);
            NSInteger matchRange = [regex numberOfMatchesInString:newString options:NSMatchingReportProgress range:textRange];
            
            if (matchRange == 0) {
                return false;
            }
        }
            break;
        case TKTextFieldStyleDollarGray:{
            NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
            NSString *pattern = @"^([0-9]{1,3}+)?(\\.([0-9]{1,2})?)?$";
            NSError *error = nil;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
            NSRange textRange = NSMakeRange(0, string.length);
            NSInteger matchRange = [regex numberOfMatchesInString:newString options:NSMatchingReportProgress range:textRange];
            
            if (matchRange == 0) {
                return false;
            }
            return true;
        }
            break;
        case TKTextFieldDescription:{
            unsigned long newLength = textField.text.length + string.length - range.length;
            return newLength <= 22; // Bool
        }
            break;
    }
    
    return true;
}

- (void)textFieldTextDidChange:(NSNotification *)notification
{
    BOOL previousShouldDrawPlaceholderValue = self.shouldDrawPlaceholder;
    self.shouldDrawPlaceholder = !self.hasText;
    
    // Only redraw if self.shouldDrawPlaceholder value was changed
    if (previousShouldDrawPlaceholderValue != self.shouldDrawPlaceholder) {
        if (self.shouldDrawPlaceholder) {
            [self hideFloatingLabel];
        } else {
            [self showFloatingLabelWithAnimation:YES];
        }
    }
}


@end
