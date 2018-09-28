//
//  ViewController.m
//  AlpVideoCameraCoverSlider
//
//  Created by xiaoyuan on 2018/9/28.
//  Copyright © 2018 xiaoyuan. All rights reserved.
//

#import "ViewController.h"
#import "AlpVideoCameraCoverSlider.h"

@interface ViewController ()
@property (nonatomic) AlpVideoCameraCoverSlider *rangeSlider;
@property (strong, nonatomic) UILabel *rangeLabel;
@property (strong, nonatomic) UILabel *valueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _rangeSlider = [AlpVideoCameraCoverSlider new];
    [self.view addSubview:_rangeSlider];
    _rangeSlider.backgroundColor = [UIColor yellowColor];
    _rangeSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:_rangeSlider attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_rangeSlider attribute:NSLayoutAttributeLeading   relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_rangeSlider attribute:NSLayoutAttributeTrailing   relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_rangeSlider attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0].active = YES;
    self.rangeSlider.value = 8000.0;
    self.rangeSlider.range = AlpVideoCameraCoverSliderMakeRange(500.0, 1000.0);
    [self.rangeSlider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.rangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100.0, self.view.frame.size.width, 20.0)];
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 70.0, self.view.frame.size.width, 20.0)];
    self.rangeLabel.textColor = [UIColor blackColor];
    self.valueLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.rangeLabel];
    [self.view addSubview:self.valueLabel];
    
    [self updateLabels];
}

- (void)valueChanged:(id)sender {
    [self updateLabels];
}

- (void)updateLabels {
    self.valueLabel.text = [NSString stringWithFormat:@"总大小:%.2f", self.rangeSlider.value];
    self.rangeLabel.text = [NSString stringWithFormat:@"范围:location:%.2f, length:%.2f", self.rangeSlider.range.location, self.rangeSlider.range.length];
    
}
@end
