//
//  UPIFaqViewController.m
//  SevenseasMoney
//
//  Created by Limra Technosys Pvt Ltd on 4/7/17.
//  Copyright © 2017 Limra Technosys Pvt Ltd. All rights reserved.
//

#import "UPIFaqViewController.h"
#import "UPIFaqCell.h"
#import "FAQDetailViewController.h"

@interface UPIFaqViewController ()

@end

@implementation UPIFaqViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"UPI Pin FAQ";
        
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FAQList" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.faqQuestionArray = [dict objectForKey:@"FAQlist"];
    self.faqDetailArray = [dict objectForKey:@"FAQDetail"];

    // Do any additional setup after loading the view from its nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"mySegue"]) {
       // static NSString *cellIdentifier = @"Cell";
    
    FAQDetailViewController *destViewController = [segue destinationViewController ];
    NSIndexPath *indexPath = [self.faqTableView indexPathForSelectedRow];
    destViewController.pass = [_faqDetailArray objectAtIndex:indexPath.row];

        
        //    destViewController. = [_faqDetailArray objectAtIndex:indexPath.row];
        
//        RecipeDetailViewController *destViewController = segue.destinationViewController;
//        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.faqQuestionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    UPIFaqCell *cell = (UPIFaqCell*)[self.faqTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"UPIFaqCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    cell.faqlabel.text = [self.faqQuestionArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FAQDetailViewController *sender = [FAQDetailViewController new];
////    sender.label = [_faqDetailArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"mySegue" sender:sender];
    [self.faqTableView deselectRowAtIndexPath:indexPath animated:YES];
//    FAQDetailViewController *detailViewController = [[UIStoryboard storyboardWithName:@"Main"bundle:nil]instantiateViewControllerWithIdentifier:@"FAQDetailViewController"];
//    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
