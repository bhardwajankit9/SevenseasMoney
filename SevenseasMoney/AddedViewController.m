//
//  AddedViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/8/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "AddedViewController.h"
#import "AddedCell.h"

@interface AddedViewController ()

@end

@implementation AddedViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.addedTableView.backgroundView = [[UIView alloc] init];
    self.addedTableView.backgroundView.backgroundColor = kCellBackgroundColor;
    
    self.addedTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"addedCell";
    AddedCell *cell = (AddedCell*)[self.addedTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"AddedCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    
    cell.backgroundColor =[UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];
    self.addedTableView.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];

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
