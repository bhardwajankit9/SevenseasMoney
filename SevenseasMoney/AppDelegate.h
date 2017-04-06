//
//  AppDelegate.h
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/28/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SevenseasMoney-swift.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(strong, nonatomic) REFrostedViewController *sideMenu;

@property (strong, nonatomic) UIWindow *window;
@property(assign, nonatomic) BOOL restrictRotation;


@end

