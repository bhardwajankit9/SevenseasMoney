//
//  VPAContactViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/6/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "VPAContactViewController.h"
#import "VPAContactTableViewCell.h"

@interface VPAContactViewController ()

@end

@implementation VPAContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"VPASConactCell";
    VPAContactTableViewCell *moneyContactTableVC = (VPAContactTableViewCell*)[_VPASContacTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (moneyContactTableVC == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"VPAContactTableViewCell" owner:self options:nil];
        moneyContactTableVC = [nibArray objectAtIndex:0];
    }
    // Configure the cell...
    
    return moneyContactTableVC;
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
