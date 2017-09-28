//
//  DebtTrackerViewController.m
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "DebtTrackerViewController.h"
#import "AppDelegate.h"

@interface DebtTrackerViewController ()

@end

@implementation DebtTrackerViewController

-(NSManagedObjectContext *)context {
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return [delegate.persistentContainer viewContext];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
