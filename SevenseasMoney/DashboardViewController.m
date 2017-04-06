//
//  DashboardViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/29/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "DashboardViewController.h"
#import "RegisterViewController.h"
#import "RechargeViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "AppDelegate.h"
#define APPDelegate                                                            \
((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface DashboardViewController () <KIImagePagerDelegate,KIImagePagerDataSource> {
    
     IBOutlet KIImagePager *pageViewController;
    NSArray *pageImages;
}

@property(nonatomic, readonly) UIView *view;

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Sevenseas Money";
    pageImages = [[NSArray alloc] initWithObjects:@"moneybanner.jpg", @"water_img.jpg", nil];

//    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
//    [singleTap setNumberOfTapsRequired:1];
//    [singleTap setNumberOfTouchesRequired:1];
//    [self.rechargeView addGestureRecognizer:singleTap];
//    [self.moneyView addGestureRecognizer:singleTap];
//    
//    self.navigationItem.title = @"Sevenseas Money";
    [self NavigationbarInfo];
    //[self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    //[self menuButtonForNavigationBar];
    [self rightBarLabel];
    //[self rightButtonForNavigationBar];
     return;

    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    pageViewController.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageViewController.pageControl.pageIndicatorTintColor = [UIColor blueColor];
    pageViewController.slideshowTimeInterval = 1.0f;
    pageViewController.slideshowShouldCallScrollToDelegate = YES;
    
}

- (void) rightBarLabel{

    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(360, 8, 50, 30)];
    [label setBackgroundColor:[UIColor whiteColor]];
    label.text = @"16.00";
    label.layer.cornerRadius = 10.0;
    label.layer.masksToBounds = YES;
    [[self.navigationController navigationBar] addSubview:label];

}

//- (void)oneTap:(UIGestureRecognizer *)gesture {
//     UIView *view = gesture.view;
//    if (view.tag == 1){
//        RechargeViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RechargeViewController"];
////        [dvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
//        [self presentViewController:dvc animated:YES completion:nil];
//    
//    }else if (view.tag == 2){
//        RechargeViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RechargeViewController"];
////        [dvc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//        [self presentViewController:dvc animated:YES completion:nil];
//
//    
//    }else if (view.tag == 3){
//        //        RechargeViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RechargeViewController"];
//        //        [dvc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//        //        [self presentViewController:dvc animated:YES completion:nil];
//        
//    }else if (view.tag == 4){
//        //        RechargeViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RechargeViewController"];
//        //        [dvc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//        //        [self presentViewController:dvc animated:YES completion:nil];
//        
//        
//    }else if (view.tag == 5){
//        //        RechargeViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RechargeViewController"];
//        //        [dvc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//        //        [self presentViewController:dvc animated:YES completion:nil];
//        
//        
//    }else if (view.tag == 5){
//        //        RechargeViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RechargeViewController"];
//        //        [dvc setModalTransitionStyle:UIModalTransitionStylePartialCurl];
//        //        [self presentViewController:dvc animated:YES completion:nil];
//        
//        
//    }
//
//
//
//}



#pragma mark - KIImagePager DataSource

- (NSArray *) arrayWithImages:(KIImagePager*)pager{
    
    return pageImages;

}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager *)pager
{
    
    return UIViewContentModeScaleToFill;
}


#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
    
    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    
    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuButton:(id)sender {
   [APPDelegate.sideMenu presentMenuViewController];

}
@end
