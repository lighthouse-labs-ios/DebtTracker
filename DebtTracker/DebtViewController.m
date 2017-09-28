//
//  DebtViewController.m
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "DebtViewController.h"
#import "Debt+CoreDataClass.h"

@interface DebtViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *owedByTextField;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<Debt*> *debts;
@end

@implementation DebtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.debts = [self.user.debts.allObjects mutableCopy];;
}
- (IBAction)didTapAddDebtButton:(id)sender {
    Debt *debt = [NSEntityDescription insertNewObjectForEntityForName:@"Debt" inManagedObjectContext:[self context]];
    debt.owner = self.user;
    debt.owedBy = self.owedByTextField.text;
    int16_t amount = [self.amountTextField.text intValue];
    debt.amount = amount;
    [self.user addDebtsObject:debt];
    NSError *error = nil;
    [[self context] save:&error];
    if (error == nil) {
        [self.debts addObject:debt];
        [self.tableView reloadData];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.debts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Debt *debtForCell = self.debts[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%i", debtForCell.amount];
    cell.detailTextLabel.text = debtForCell.owedBy;
    return cell;
}

@end
