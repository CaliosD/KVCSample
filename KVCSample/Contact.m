//
//  Contact.m
//  KVCSample
//
//  Created by Calios on 5/29/17.
//  Copyright © 2017 Calios. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+ (instancetype)contactWithRancomName
{
	static NSArray *allFirstNames;
	static NSArray *allLastNames;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		allFirstNames = @[@"Mary", @"Patricia", @"Linda", @"Barbara", @"Elizabeth", @"Jennifer", @"Maria", @"Susan", @"Margaret", @"Dorothy", @"Lisa", @"Nancy", @"Karen", @"Betty", @"Helen"];
		allLastNames = @[@"Smith", @"Johnson", @"Williams", @"Jones", @"Brown", @"Davis", @"Miller", @"Wilson", @"Moore", @"Taylor", @"Anderson", @"Thomas", @"Jackson", @"White"];
	});
	Contact *result = [[self alloc] init];
	result.name = [NSString stringWithFormat:@"%@ %@",
				   allFirstNames[arc4random_uniform((int32_t)[allFirstNames count])],
				   allLastNames[arc4random_uniform((int32_t)[allLastNames count])]];
	return result;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"Contact description: \nname: %@, nickname: %@, email: %@, city: %@", self.name,self.nickname,self.email,self.city];
}

- (BOOL)validateName:(NSString **)nameP error:(NSError * __autoreleasing *)error
{
	if (*nameP == nil) {
		*nameP = @"";
		return YES;
	}
	else {
		NSArray *components = [*nameP componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *component, NSDictionary<NSString *,id> * _Nullable bindings) {
			return (0 < [component length]);
		}]];
		*nameP = [components componentsJoinedByString:@" "];
		return  YES;
	}
}

- (BOOL)validateEmail:(NSString **)emailP error:(NSError * __autoreleasing *)error
{
	if (*emailP == nil) {
		*emailP = @"";
		return YES;
	} else {
		NSArray *components = [*emailP componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		*emailP = [[components componentsJoinedByString:@""] lowercaseString];
		return YES;
	}
}

@end
