//
//  ContactListViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/6/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "ContactListViewController.h"
#import "ContactTableViewCell.h"
#import "KTSContactsManager.h"

@interface ContactListViewController () <KTSContactsManagerDelegate>
@property (strong, nonatomic) NSArray *tableData;

@property (strong, nonatomic) KTSContactsManager *contactsManager;
@end

@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contactsManager = [KTSContactsManager sharedManager];
    self.contactsManager.delegate = self;
    self.contactsManager.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES] ];
    [self loadData];

//    [self.contactTableview registerNib:[UINib nibWithNibName:@"ContactTableViewCell" bundle:nil] forCellReuseIdentifier:@"ContactTableViewCell"];

    // Do any additional setup after loading the view from its nib.
}

- (void)loadData
{
    [self.contactsManager importContacts:^(NSArray *contacts)
     {
         self.tableData = contacts;
         [self.contactTableview reloadData];
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

- (IBAction)addContact:(UIBarButtonItem *)sender
{
    [self.contactsManager addContactName:@"John"
                                lastName:@"Smith"
                                  phones:@[@{
                                               @"value":@"+7-903-469-97-48",
                                               @"label":@"Mobile"
                                               }]
                                  emails:@[@{
                                               @"value":@"mail@mail.com",
                                               @"label": @"home e-mail"
                                               }]
                                birthday:[NSDate dateWithTimeInterval:22 * 365 * 24 * 60 * 60 sinceDate:[NSDate date]]
                                   image:[UIImage imageNamed:@"newContact"]
                              completion:^(BOOL wasAdded) {
                                  NSLog(@"Contact was %@ added",wasAdded ? @"" : @"NOT");
                              }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"ContactCell";
    ContactTableViewCell *cell = (ContactTableViewCell*)[_contactTableview dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"ContactTableViewCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    NSDictionary *contact = [self.tableData objectAtIndex:indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    NSString *firstName = contact[@"firstName"];
    nameLabel.text = [firstName stringByAppendingString:[NSString stringWithFormat:@" %@", contact[@"lastName"]]];
    
    UILabel *phoneNumber = (UILabel *)[cell viewWithTag:2];
    NSArray *phones = contact[@"phones"];
    
    if ([phones count] > 0) {
        NSDictionary *phoneItem = phones[0];
        phoneNumber.text = phoneItem[@"value"];
    }
    
    UIImageView *cellIconView = (UIImageView *)[cell.contentView viewWithTag:888];
    
    UIImage *image = contact[@"image"];
    cellIconView.image = (image != nil) ? image : [UIImage imageNamed:@"Contact"];
    cellIconView.contentScaleFactor = UIViewContentModeScaleAspectFill;
    cellIconView.layer.cornerRadius = CGRectGetHeight(cellIconView.frame) / 2;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
