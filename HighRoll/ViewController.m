//
//  ViewController.m
//  HighRoll
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *belowOrAboveSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *totalBetLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *totalBetSegmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *dieOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dieTwoImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _balance = 100;
    _rollCount = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rollButtonPressed:(id)sender {
    _dieOne = [self randomize:1 max:6];
    _dieTwo = [self randomize:1 max:6];
    NSLog(@"dieOne = %i, dieTwo = %i", _dieOne, _dieTwo);
}

- (int)randomize:(int)min max:(int)max {
    return min + arc4random_uniform(max - min + 1);
}


@end
