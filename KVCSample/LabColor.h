//
//  LabColor.h
//  KVCSample
//
//  Created by Calios on 5/27/17.
//  Copyright © 2017 Calios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabColor : NSObject

@property (nonatomic) double lComponent;
@property (nonatomic) double aComponent;
@property (nonatomic) double bComponent;

@property (nonatomic, readonly) double redComponent;
@property (nonatomic, readonly) double greenComponent;
@property (nonatomic, readonly) double blueComponent;

@property (nonatomic, strong, readonly) UIColor *color;

@end
