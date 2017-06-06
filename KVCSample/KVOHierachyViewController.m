//
//  KVOHierachyViewController.m
//  KVCSample
//
//  Created by Calios on 6/6/17.
//  Copyright © 2017 Calios. All rights reserved.
//

#import "KVOHierachyViewController.h"

@interface A : NSObject
@property (nonatomic, strong) NSString *height;
@end

@interface B : A

@end

@implementation A

@end

@implementation B

@end

@interface KVOHierachyViewController ()

@property (nonatomic, strong) A *a;
@property (nonatomic, strong) B *b;

@end

@implementation KVOHierachyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.a = [[A alloc] init];
	self.b = [[B alloc] init];
	self.a.height = @"0";
	self.b.height = @"1";
	
	[self.a addObserver:self forKeyPath:@"height" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
	[self.b addObserver:self forKeyPath:@"height" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
	
	
	self.a.height = @"0-after";
	self.b.height = @"1-after";
}

- (void)dealloc
{
	[self.a removeObserver:self.a forKeyPath:@"height"];
	[self.b removeObserver:self.b forKeyPath:@"height"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
	NSLog(@"keyPath: %@, object: %@, change: %@, context: %@", keyPath, object, change, context);
}

@end
