//
//  WalletViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 3/30/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "WalletViewController.h"
#import "UIViewController+V2CustomViewController.h"
#import "WalletTableViewCell.h"
@interface WalletViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Sevenseas Money";
    [self NavigationbarInfo];
    [self backButtonForNavigationBar];
    [self infoButtonNavigationBar];
    
    self.walletTableView.backgroundView = [[UIView alloc] init];
    self.walletTableView.backgroundView.backgroundColor = kCellBackgroundColor;
    self.paidView.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];
    self.receivedView.hidden = YES;
    self.addedView.hidden = YES;
    self.walletTableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackgroundImage"]];
//      [walletTableView s]

  //  self.walletTableView.backgroundView = tempImageView;
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"WalletTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
   

   // cell.backgroundColor = [UIColor clearColor];
    cell.backgroundColor =[UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];
    self.walletTableView.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];

//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//    }
    
    //cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
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

- (IBAction)paidButtonAction:(id)sender {
    self.paidView.hidden = NO;
    self.paidView.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];
    self.receivedView.hidden = YES;
    self.addedView.hidden = YES;
    self.walletTableView.reloadData;

}

- (IBAction)receivedButtonAction:(id)sender {
    self.receivedView.hidden = NO;
    self.receivedView.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];
    self.addedView.hidden = YES;
    self.paidView.hidden = YES;

}

- (IBAction)addedButtonAction:(id)sender {
    self.addedView.hidden = NO;

    self.addedView.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];
    self.receivedView.hidden = YES;
    self.paidView.hidden = YES;

}
@end
