//
//  User+CoreDataProperties.m
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic username;
@dynamic password;
@dynamic debts;

@end
