//
//  Debt+CoreDataProperties.h
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//
//

#import "Debt+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Debt (CoreDataProperties)

+ (NSFetchRequest<Debt *> *)fetchRequest;

@property (nonatomic) int16_t amount;
@property (nonatomic) BOOL isPaid;
@property (nullable, nonatomic, copy) NSDate *dueDate;
@property (nullable, nonatomic, copy) NSString *owedBy;
@property (nullable, nonatomic, retain) User *owner;

@end

NS_ASSUME_NONNULL_END
