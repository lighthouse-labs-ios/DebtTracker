//
//  ViewController.m
//  DebtTracker
//
//  Created by Kareem Sabri on 2017-09-28.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "ViewController.h"
#import "DebtViewController.h"
#import "AppDelegate.h"
#import "User+CoreDataClass.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.submitButton.enabled = false;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DebtViewController *vc = [segue destinationViewController];
    vc.user = sender;
}

- (IBAction)didTapSubmitButton:(UIButton *)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    User *user = [self findUserWithUsername:username];
    if (user != nil) {
        //user exists
        
        if (user.password == password) {
            //user is logged in
            //@todo: segue to next view controller with user
            [self performSegueWithIdentifier:@"goToDebts" sender:user];
        } else {
            //wrong password!
            //@todo: show an error
        }
    } else {
        //we did not find a match so create new user
        User *user = [self createUserWithUsername:username andPassword:password];
        if (user != nil) {
            [self performSegueWithIdentifier:@"goToDebts" sender:user];
        } else {
            //@todo: handle error
            //creation failed
        }
    
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.submitButton.enabled = self.passwordTextField.text != NULL && self.usernameTextField.text != NULL;
    [textField resignFirstResponder];
    return true;
}

- (User*)findUserWithUsername:(NSString *)username {
    NSManagedObjectContext *context = [self context];
    NSFetchRequest<User*> *fetchRequest = [User fetchRequest];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"username = %@", username];
    NSError *error = nil;
    NSArray<User*> *users = [context executeFetchRequest:fetchRequest error:&error];
    if (error != nil || users.count == 0) {
        return nil;
    }
    NSLog(@"Found user");
    return users[0];
}

- (User*)createUserWithUsername:(NSString *)username andPassword:(NSString *)password {
    NSLog(@"Creating new user");
    NSManagedObjectContext *context = [self context];
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    user.username = username;
    user.password = password;
    NSError *error = nil;
    [context save:&error];
    if (error == nil) {
        NSLog(@"%@", user);
        return user;
    } else {
        NSLog(@"%@", error);
        return nil;
    }
}

@end
