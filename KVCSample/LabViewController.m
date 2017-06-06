//
//  ViewController.m
//  KVCSample
//
//  Created by Calios on 5/27/17.
//  Copyright © 2017 Calios. All rights reserved.
//

#import "LabViewController.h"
#import "LabColor.h"
#import "KeyValueObserver.h"

@interface LabViewController ()

@property (nonatomic, strong) LabColor *labColor;
@property (nonatomic, strong) id colorObserveToken;
@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *aSlider;
@property (weak, nonatomic) IBOutlet UISlider *bSlider;

@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation LabViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.labColor = [[LabColor alloc] init];
}

- (void)setLabColor:(LabColor *)labColor
{
	_labColor = labColor;
	self.colorObserveToken = [KeyValueObserver observeObject:labColor keyPath:@"color" target:self selector:@selector(colorDidChange:) options:NSKeyValueObservingOptionInitial];
	self.lSlider.value = self.labColor.lComponent;
	self.aSlider.value = self.labColor.aComponent;
	self.bSlider.value = self.labColor.bComponent;
}

#pragma mark - Action

- (IBAction)updateLComponent:(UISlider *)sender;
{
	self.labColor.lComponent = sender.value;
}

- (IBAction)updateAComponent:(UISlider *)sender;
{
	self.labColor.aComponent = sender.value;
}

- (IBAction)updateBComponent:(UISlider *)sender;
{
	self.labColor.bComponent = sender.value;
}

#pragma mark - Observer

- (void)colorDidChange: (NSDictionary *)change
{
	self.colorView.backgroundColor = self.labColor.color;
}

@end
