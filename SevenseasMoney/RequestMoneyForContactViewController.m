//
//  RequestMoneyForContactViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/6/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "RequestMoneyForContactViewController.h"
#import "MoneyContactTableViewCell.h"
#import "KTSContactsManager.h"


@interface RequestMoneyForContactViewController () <KTSContactsManagerDelegate>
@property (strong, nonatomic) KTSContactsManager *contactsManager;
@property (strong, nonatomic) NSArray *tableData;

@end

@implementation RequestMoneyForContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contactsManager = [KTSContactsManager sharedManager];
    self.contactsManager.delegate = self;
    self.contactsManager.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES] ];
    [self loadData];

    // Do any additional setup after loading the view from its nib.
}

- (void)loadData
{
    [self.contactsManager importContacts:^(NSArray *contacts)
     {
         self.tableData = contacts;
         [self.contacttableView reloadData];
         NSLog(@"contacts: %@",contacts);
     }];
}

-(void)addressBookDidChange
{
    NSLog(@"Address Book Change");
    [self loadData];
}

-(BOOL)filterToContact:(NSDictionary *)contact
{
    return YES;
    return ![contact[@"company"] isEqualToString:@""];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"MoneyConatctCell";
    MoneyContactTableViewCell *moneyContactTableVC = (MoneyContactTableViewCell*)[_contacttableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (moneyContactTableVC == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"MoneyContactTableViewCell" owner:self options:nil];
        moneyContactTableVC = [nibArray objectAtIndex:0];
    }
    
    //// Contact List
    NSDictionary *contact = [self.tableData objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[moneyContactTableVC viewWithTag:1];
    NSString *firstName = contact[@"firstName"];
    nameLabel.text = [firstName stringByAppendingString:[NSString stringWithFormat:@" %@", contact[@"lastName"]]];
    
    UILabel *phoneNumber = (UILabel *)[moneyContactTableVC viewWithTag:2];
    NSArray *phones = contact[@"phones"];
    
    if ([phones count] > 0) {
        NSDictionary *phoneItem = phones[0];
        phoneNumber.text = phoneItem[@"value"];
    }
    
    UIImageView *cellIconView = (UIImageView *)[moneyContactTableVC.contentView viewWithTag:888];
    
    UIImage *image = contact[@"image"];
    
    cellIconView.image = (image != nil) ? image : [UIImage imageNamed:@"Contact"];
    cellIconView.contentScaleFactor = UIViewContentModeScaleAspectFill;
    cellIconView.layer.cornerRadius = CGRectGetHeight(cellIconView.frame) / 2;
    
//    [self.contactsManager addContactName:@"John"
//                                lastName:@"Smith"
//                                  phones:@[@{
//                                               @"value":@"+7-903-469-97-48",
//                                               @"label":@"Mobile"
//                                               }]
//                                  emails:@[@{
//                                               @"value":@"mail@mail.com",
//                                               @"label": @"home e-mail"
//                                               }]
//                                birthday:[NSDate dateWithTimeInterval:22 * 365 * 24 * 60 * 60 sinceDate:[NSDate date]]
//                                   image:[UIImage imageNamed:@"newContact"]
//                              completion:^(BOOL wasAdded) {
//                                  NSLog(@"Contact was %@ added",wasAdded ? @"" : @"NOT");
//                              }];

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
