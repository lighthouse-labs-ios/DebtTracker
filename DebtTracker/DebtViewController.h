//
//  DebtViewController.h
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "DebtTrackerViewController.h"
#import "User+CoreDataClass.h"

@interface DebtViewController : DebtTrackerViewController
@property (nonatomic, strong) User *user;
@end
