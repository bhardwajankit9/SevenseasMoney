//
//  UIViewController+V2CustomViewController.m
//  V2CompomentsInternal
//
//  Created by ashok.londhe on 22/06/16.
//  Copyright © 2016 V2Solutions. All rights reserved.
//

#import "UIViewController+V2CustomViewController.h"
#import "AppDelegate.h"


@implementation UIViewController (V2CustomViewController)

-(void)backButtonForNavigationBarModulesList{
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,40)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"backButton"]forState:UIControlStateNormal];
    self.navigationItem.hidesBackButton = true;
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(popModulesViewController) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = backBarButton;
    
}

-(void)backButtonForNavigationBar{
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,40)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"backButton"]forState:UIControlStateNormal];
    self.navigationItem.hidesBackButton = true;
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(popCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = backBarButton;
    
}

-(void)rightButtonForNavigationBar:(UIViewController*)viewController{
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,50,40)];
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"backButtonIcon"]forState:UIControlStateNormal];
    [rightButton setTitle:[NSString stringWithFormat:@"More"] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(pushCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    self.navigationItem.hidesBackButton = true;
    
}

-(void)infoButtonNavigationBar{
   
    UIButton *infoButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,40)];
    [infoButton setBackgroundImage:[UIImage imageNamed:@"infoButton"]forState:UIControlStateNormal];
    UIBarButtonItem *infoBarButton = [[UIBarButtonItem alloc]initWithCustomView:infoButton];
    [infoButton addTarget:self action:@selector(componentInformation) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = infoBarButton;
    self.navigationItem.hidesBackButton = false;
    
}


-(void)popCurrentViewController{
    AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.restrictRotation = YES;
    [appDelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:appDelegate.window];
    [UIViewController attemptRotationToDeviceOrientation];
    [[UIDevice currentDevice] setValue:@"1" forKey:@"orientation"];
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void) viewWillLayoutSubviews
//{
//    [UIViewController attemptRotationToDeviceOrientation];
//}

-(NSUInteger)supportedInterfaceOrientations
{
    AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    if(appDelegate.restrictRotation)
    {
        return UIInterfaceOrientationMaskPortrait;
    }
    else
    {
        
        return UIInterfaceOrientationMaskAll;
    }

}


-(void)NavigationbarInfo{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UINavigationBar *bar = [self.navigationController navigationBar];
   // [bar setBackgroundColor:[UIColor blackColor]];
   // UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginImage"]];
//    CGSize imageSize = CGSizeMake(25, 25);
//    CGFloat marginX = (self.navigationController.navigationBar.frame.size.width / 2) - (imageSize.width / 2);
    
    //imageView.frame = CGRectMake(85, 10, imageSize.width, imageSize.height);
   // [self.navigationController.navigationBar addSubview:imageView];

     self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //[self.navigationController popViewControllerAnimated:YES];
    
}

-(void)menuButtonForNavigationBar{
    //    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,40,40)];
    //    [backButton setBackgroundImage:[UIImage imageNamed:@"SideMenu.png"]forState:UIControlStateNormal];
    //    self.navigationItem.hidesBackButton = true;
    //    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    //    [backButton addTarget:self action:@selector(popCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    //
    //    self.navigationItem.leftBarButtonItem = backBarButton;
    //    UIButton *homeBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    //    [homeBtn setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
    //[homeBtn addTarget:self action:@selector(home) forControlEvents:UIControlEventTouchUpInside];
    //[homeBtn setFrame:CGRectMake(0, 0, 32, 32)];
    
    UIButton *settingsBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [settingsBtn setImage:[UIImage imageNamed:@"SideMenu.png"] forState:UIControlStateNormal];
    //[settingsBtn addTarget:self action:@selector(settings) forControlEvents:UIControlEventTouchUpInside];
    [settingsBtn setFrame:CGRectMake(-20, 0, 40, 40)];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(-20, 0, 40, 40)];
    // [rightBarButtonItems addSubview:homeBtn];
    [rightBarButtonItems addSubview:settingsBtn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
   // [APPDelegate.sideMenu presentMenuViewController];
}





@end
