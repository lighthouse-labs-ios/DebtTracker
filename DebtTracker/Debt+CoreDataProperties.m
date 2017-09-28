//
//  Debt+CoreDataProperties.m
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//
//

#import "Debt+CoreDataProperties.h"

@implementation Debt (CoreDataProperties)

+ (NSFetchRequest<Debt *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Debt"];
}

@dynamic amount;
@dynamic isPaid;
@dynamic dueDate;
@dynamic owedBy;
@dynamic owner;

@end
