//
//  ReceivedViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/8/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "ReceivedViewController.h"
#import "ReceiveCell.h"
@interface ReceivedViewController ()

@end

@implementation ReceivedViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.receiveTableVIew.backgroundView = [[UIView alloc] init];
    self.receiveTableVIew.backgroundView.backgroundColor = kCellBackgroundColor;
    
    self.receiveTableVIew.separatorStyle = UITableViewCellSelectionStyleNone;
    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"receiveCell";
    ReceiveCell *cell = (ReceiveCell*)[self.receiveTableVIew dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"ReceiveCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    
    cell.backgroundColor =[UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];
    self.receiveTableVIew.backgroundColor = [UIColor colorWithRed:0.0/255.0f green:175.0/255.0f blue:255.0/255.0f alpha: 1.0];

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


@end
