//
//  SideMenuViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/4/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SideMenuTableViewCell.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sideMenuTableView.delegate = self;
    self.sideMenuTableView.dataSource = self;
//    _imageArray = [NSArray arrayWithObjects:@"myaccount.png","wallet.png","payment.png","add.png","aboutus.png","contactus.png", nil];
//    _labelArray = [NSArray arrayWithObjects:@"My Account","My Balance","Recharge History","About Us","Contact Us",nil];
    _labelArray = [NSArray arrayWithObjects:@"My Account",@"My Balance",@"Request Balance",@"Recharge History",@"About Us",@"Contact Us",@"Logout",nil];
    _imageArray = [NSArray arrayWithObjects:@"myaccount.png",@"wallet.png",@"wallet.png",@"payment.png",@"add.png",@"aboutus.png",@"contactus.png",nil];

    self.profileImage.imageView.image = [UIImage imageNamed:@"image"];
    [self.profileImage setBorderColor:V2BorderWhite];
    [self.profileImage setImageStyle:V2ImageStyleCircle];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_labelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomCell";
    
    SideMenuTableViewCell *cell = (SideMenuTableViewCell *)[_sideMenuTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"SideMenuTableViewCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    cell.label.text = [_labelArray objectAtIndex:indexPath.row];
   // cell.menuImage.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
   // cell.label.text = [_labelArray objectAtIndex:indexPath.row];
    ///cell.menuImage.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}


@end
