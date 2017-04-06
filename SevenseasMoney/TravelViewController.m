//
//  TravelViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/30/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "TravelViewController.h"
#import "UIViewController+V2CustomViewController.h"

@interface TravelViewController ()

@end

@implementation TravelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Sevenseas Money";
    //[self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.hidesBackButton = true;
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar setBackgroundColor:[UIColor blackColor]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginImage"]];
    CGSize imageSize = CGSizeMake(25, 25);
    CGFloat marginX = (self.navigationController.navigationBar.frame.size.width / 2) - (imageSize.width / 2);
    
    imageView.frame = CGRectMake(85, 10, imageSize.width, imageSize.height);
    [self.navigationController.navigationBar addSubview:imageView];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
