//
//  MenuViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/7/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _labelArray = [NSArray arrayWithObjects:@"My Account",@"My Balance",@"Request Balance",@"Recharge History",@"About Us",@"Contact Us",@"Logout",nil];
    _imageArray = [NSArray arrayWithObjects:@"myaccount.png",@"wallet.png",@"wallet.png",@"payment.png",@"add.png",@"aboutus.png",@"contactus.png",nil];
    
    self.profileImageView.imageView.image = [UIImage imageNamed:@"image"];
    [self.profileImageView setBorderColor:V2BorderWhite];
    [self.profileImageView setImageStyle:V2ImageStyleCircle];

    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_labelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    MenuCell *cell = (MenuCell*)[self.menuTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    cell.MenuLabel.text = [_labelArray objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];

    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
