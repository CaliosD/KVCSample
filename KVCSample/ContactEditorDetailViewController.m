//
//  ContactEditorDetailViewController.m
//  KVCSample
//
//  Created by Calios on 5/29/17.
//  Copyright © 2017 Calios. All rights reserved.
//

#import "ContactEditorDetailViewController.h"
#import "Contact.h"

@interface ContactEditorDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;

@property (nonatomic, strong) Contact *contact;
@end

@implementation ContactEditorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.contact = [Contact contactWithRancomName];
	[self updateTextFields];
}

- (NSArray *)contactStringKeys
{
	return @[@"name", @"nickname", @"email", @"city"];
}

- (UITextField *)textFieldForKey:(NSString *)key
{
	return [self valueForKey:[key stringByAppendingString:@"TextField"]];
}

- (void)updateTextFields
{
	for (NSString *key  in  [self contactStringKeys]) {
		[self textFieldForKey:key].text = [self.contact valueForKey:key];
	}
}

- (IBAction)fieldEditingDidEnd:(UITextField *)sender
{
	for (NSString *key in [self contactStringKeys]) {
		UITextField *tf = [self textFieldForKey:key];
		if (tf == sender) {
			id value = sender.text;
			NSError *error = nil;
			if ([self.contact validateValue:&value forKey:key error:&error]) {
				[self.contact setValue:value forKey:key];
			}
			else {
				NSLog(@"Error: %@",error);
			}
			sender.text = value;
			break;
		}
	}
	NSLog(@"%@", self.contact.description);
}
@end
