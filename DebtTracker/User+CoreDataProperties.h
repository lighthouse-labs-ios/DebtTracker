//
//  User+CoreDataProperties.h
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *username;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, retain) NSSet<Debt *> *debts;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addDebtsObject:(Debt *)value;
- (void)removeDebtsObject:(Debt *)value;
- (void)addDebts:(NSSet<Debt *> *)values;
- (void)removeDebts:(NSSet<Debt *> *)values;

@end

NS_ASSUME_NONNULL_END
