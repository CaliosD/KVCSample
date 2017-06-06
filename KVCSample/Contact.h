//
//  Contact.h
//  KVCSample
//
//  Created by Calios on 5/29/17.
//  Copyright © 2017 Calios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

+ (instancetype)contactWithRancomName;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *city;

@end
